//
//  TextFieldKitEx.swift
//  TextFieldKit
//
//  Created by Salah on 11/18/21.
//

import Foundation
import UIKit
import CoreLocation
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
extension CLLocationCoordinate2D{
    var stringValue:String{
        return "\(self.latitude),\(self.longitude)"
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
public enum RegularExpression:String{
    case email="[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case phone = "[+]+[0-9 ]{1,}|[00]+[0-9 ]{1,}|[0-9 ]{9,}"
    case empty=".*[^ ].*"
    var regex:Regex{
        return Regex.init(self.rawValue);
    }
    func  matches(_ input:String)->Bool{
    return self.regex.matches(input:input)
    }
}
extension String{
    var customLocalize_ : String {
       return NSLocalizedString(self, tableName: nil, bundle:Bundle.module ?? Bundle.main, value: "", comment: "")
   }
    public func cutomelocalizedWith(variables: CVarArg...) -> String {
        return String(format: self.customLocalize_, arguments: variables)
    }
    
    var isEmpty:Bool{
        return (RegularExpression.empty.matches(self)==false)
    }
}


// MARK: FieldType
public enum FieldType:String{
case username="Username"
case fullName="FullName"
case password="Password"
case newPassword="NewPassword"
case confirmPassword="ConfirmPassword"
case email="Email"
case title="Title"
case description="Description"
case address="Address"
case requirements="Requirements"
case phoneNumber="PhoneNumber"
case location="Location"
case city="City"
case region="Region"

    
var title:String{
    return self.rawValue.customLocalize_;
}
}

// MARK: FieldError
public enum FieldError{
case empty(_ name:String)
case notValid(_ name:String)
case passwordNotMatch
case passwordLessThan6
case other(_ message:String)
var message:String{
    
    switch self{
    case .empty( let name):
        return "TextFeildValidation".cutomelocalizedWith(variables:name)
    case .notValid( let name):
        return "NotValid".cutomelocalizedWith(variables:name)
    case .passwordNotMatch:
        return "PasswordNotMatch".customLocalize_
    case .passwordLessThan6:
        return "PasswordMustHave6".customLocalize_
    case .other(let message):
        return message
    }
}
}
// MARK: Field
public protocol Field{
    var fieldType:FieldType {get};
}
// MARK: FieldValiadtion
public protocol FieldValiadtion{
    var messages:[FieldError] {get};
}
// MARK: GeneralFieldViewProrocol
protocol GeneralFieldViewProrocol{
var text:String? {set get};
var placeholder:String? {set get};
var error:String? {set get};
}
public protocol CutomFieldProrocol{
     func selectedStyle();
     func normalStyle();
     func filledStyle();
     func cutomLayoutSubviews()
     var nibName:String { get}

}
// MARK: GeneralConnection
protocol GeneralConnection:Field,FieldValiadtion{

}
public extension Array where Element == FieldValiadtion {
//    func showFieldErros(){
//        for item in self{
////            (item as? TextField).error = item.messages
//        }
//    }
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

//extension Array where Self:GeneralFieldViewProrocol {
//
//}
