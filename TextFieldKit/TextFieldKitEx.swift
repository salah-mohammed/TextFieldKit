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


// MARK: FieldType
//public enum FieldType{
//case firstName
//case lastName
//case username
//case fullName
//case password
//case newPassword
//case confirmPassword
//case email
//case title
//case description
//case address
//case requirements
//case phoneNumber
//case location
//case city
//case region
//case cutome(String)
//var title:String{
//    switch self{
//    case .cutome(let value):
//        return value
//    default:
//        return self.key.customLocalize_
//    }
//}
//    var key:String{
//        switch self{
//        case .firstName:
//            return "Firstname"
//        case .lastName:
//            return "Lastname"
//        case .username:
//            return "Username"
//        case .fullName:
//            return "FullName"
//        case .password:
//            return "Password"
//        case .newPassword:
//            return "NewPassword"
//        case .confirmPassword:
//            return "ConfirmPassword"
//        case .email:
//            return "Email"
//        case .title:
//            return "Title"
//        case .description:
//            return "Description"
//        case .address:
//            return "Address"
//        case .requirements:
//            return "Requirements"
//        case .phoneNumber:
//            return "PhoneNumber"
//        case .location:
//            return "Location"
//        case .city:
//            return "City"
//        case .region:
//            return "Region"
//        case .cutome(let value):
//            return value
//        }
//    }
//}

// MARK: FieldError
public enum FieldError{
case required(_ name:String)
case notValid(_ name:String)
case choose(_ name:String)
case passwordNotMatch
case passwordLessThan6
case other(_ message:String)
    //fieldRequired
    //pleaseChoose
    //pleaseEnter
var message:String{
    switch self{
    case .required( let name):
        return "TextFeildValidation".cutomelocalizedWith(variables:name)
    case .notValid( let name):
        return "NotValid".cutomelocalizedWith(variables:name)
    case .passwordNotMatch:
        return "PasswordNotMatch".customLocalize_
    case .passwordLessThan6:
        return "PasswordMustHave6".customLocalize_
    case .other(let message):
        return message
    case .choose(_):
        return ""
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

public func check(requiredFields:[FieldValiadtion],
           allField:[GeneralFieldViewProrocol]){
    for field in allField{
        let contains = requiredFields.contains(where: {return $0 == field})
        let messages = (field as? FieldValiadtion)?.messages ?? []
        field.error = (messages.valid == true || contains == false) ? nil:messages.string
    }
}

public extension Array where Element == GeneralFieldViewProrocol {
    func clearErrors(){
        for field in self{
            field.error=nil
        }
    }
}
