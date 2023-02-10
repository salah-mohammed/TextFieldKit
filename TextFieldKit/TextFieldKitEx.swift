//
//  TextFieldKitEx.swift
//  TextFieldKit
//
//  Created by Salah on 11/18/21.
//

import Foundation
import UIKit
import CoreLocation
import SwiftUI
#if canImport(PhoneKit)
import PhoneKit
#endif
extension UIImage {
    class func bs_frameWorkInit(named:String)->UIImage?{
        return UIImage.init(named: named, in:Bundle.module, compatibleWith: nil);
    }
}
extension UIColor {
    class func bs_frameWorkInit(named:String)->UIColor?{
        return UIColor.init(named: named, in: Bundle.module, compatibleWith: nil)
    }
}
extension UIView{
        var bs_parent: UIViewController? {
            // Starts from next (As we know self is not a UIViewController).
            var parentResponder: UIResponder? = self.next
            while parentResponder != nil {
                if let viewController = parentResponder as? UIViewController {
                    return viewController
                }
                parentResponder = parentResponder?.next
            }
            return nil
        }
}

extension Bundle {
    static var module: Bundle? = {
        //firstBundle -> this will used when libarary used in example
        if let firstBundle = Bundle(path: "\(Bundle.main.bundlePath)/Frameworks/TextFieldKit.framework/TextFieldKit.bundle"),FileManager.default.fileExists(atPath: firstBundle.bundlePath){
        
    return firstBundle
    }else
        //secondBundle -> this will used when libarary used in pods and add libarary as static libarary
       if let firstBundle = Bundle(path: "\(Bundle.main.bundlePath)/TextFieldKit.bundle"),FileManager.default.fileExists(atPath: firstBundle.bundlePath){
    return firstBundle
    }else
        //thiredBundle -> this will used when libarary used in pods
if let secondBundle:Bundle = Bundle(path: "\(Bundle.main.bundlePath)/Frameworks/TextFieldKit.framework"),FileManager.default.fileExists(atPath: secondBundle.bundlePath){
            return secondBundle;
    }
      return nil
    }()
}

extension String{
    static var fieldsType:[String]{
     return ["TextFieldView","TextViewView","DropDownTextField"]
    }
    var customLocalize_ : String {
       return NSLocalizedString(self, tableName: nil, bundle:Bundle.module ?? Bundle.main, value: "", comment: "")
   }
    public func cutomelocalizedWith(variables: CVarArg...) -> String {
        return String(format: self.customLocalize_, arguments: variables)
    }
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

public protocol FieldErrorProtocol{
    var message:String{get}
}
// MARK: FieldError
public enum FieldError:FieldErrorProtocol{
case required(_ name:String)
case fieldRequired(_ name:String)
case notValid(_ name:String)
case choose(_ name:String)
case enter(_ name:String)
case otherRequired(_ message:String)
case otherValid(_ message:String)
public var message:String{
    switch self{
    case .required( let fieldName):
        return "Required".cutomelocalizedWith(variables:fieldName)
    case .fieldRequired( let fieldName):
        return "FieldRequired".cutomelocalizedWith(variables:fieldName)
    case .notValid( let fieldName):
        return "NotValid".cutomelocalizedWith(variables:fieldName)
    case .choose(let fieldName):
        return "PleaseChoose".cutomelocalizedWith(variables:fieldName)
    case .enter(let fieldName):
        return "PleaseEnter".cutomelocalizedWith(variables:fieldName)
    case .otherRequired(let message):
        return message
    case .otherValid(let message):
        return message
    }
}
    var isRequired:Bool{
        switch self{
        case .required(let field):
            return true
        case .fieldRequired(_):
            return true
        case .notValid(_):
            return false
        case .choose(_):
            return true
        case .enter(_):
            return false
        case .otherRequired(_):
            return true
        case .otherValid(_):
            return false
        }
    }
}

public extension Array where Element == FieldError {
    var valid:Bool{
        return (self.count == 0);
    }
    var strings:[String]{
    return self.map {"- "+$0.message}
    }
    var string:String{
        return self.strings.joined(separator:"\n");
    }
    public func showAlert(_ viewController:UIViewController,handler:((UIAlertAction)->Void)?){
    let errors = self.string;
    let alert = UIAlertController.init(title:"Error".customLocalize_, message: errors, preferredStyle:.alert)
    alert.addAction(UIAlertAction.init(title:"Ok".customLocalize_, style: .default, handler: handler));
    viewController.present(alert, animated: true, completion: nil);
    }
}

#if canImport(SwiftUI)
extension UIColor{
    var bs_color:Color{
        return Color(self);
    }
}
#endif



public extension Array where Element == GeneralFieldViewProrocol {
    func clearErrors(){
        for field in self{
            field.error=nil
        }
    }
}
public class FieldsManager{
    public typealias FieldsHandler=()->[GeneralFieldViewProrocol]
    public typealias RequiredFieldsHandler=()->[FieldValiadtion]
    public var fieldsHandler:FieldsHandler?{
        didSet{
            for var field  in self.allFields{
                field.fieldDidEnd = { field in
                    self.checkField(field: field)
                }
                field.fieldDidEnd = { field in
                    self.checkField(field: field)
                }
                field.onEditingChanged = { v,fieldd in
                    self.checkField(field:field)
                }
            }
        }
    }
    public var requiredFieldsHandler:RequiredFieldsHandler?
    
    var allFields:[GeneralFieldViewProrocol]{
        return self.fieldsHandler?() ?? []
    }
    var requiredFields:[FieldValiadtion]{
        return self.requiredFieldsHandler?() ?? []
    }
    init(fieldsHandler:FieldsHandler?,requiredFieldsHandler:@escaping RequiredFieldsHandler) {
        self.fieldsHandler = fieldsHandler
        self.requiredFieldsHandler = requiredFieldsHandler
    }
    public init(){
        
    }
     public func checkAll(){
        for field in allFields{
            self.checkField(field:field)
        }
    }
    func checkField(field:GeneralFieldViewProrocol){
        let contains = requiredFields.contains(where: {return $0 == field})
        let messages = (field as? FieldValiadtion)?.messages ?? []
        let isNotRequired = messages.filter({$0.isRequired == false}) // validation error
        var errorMessage:String = messages.string
        if isNotRequired.count > 0{
            errorMessage = isNotRequired.string
        }
        field.error = (messages.valid == true || (contains == false && isNotRequired.count == 0)) ? nil:errorMessage
    }
    public func clearErrors(){
        self.allFields.clearErrors()
    }
}
