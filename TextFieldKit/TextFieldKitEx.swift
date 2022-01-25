//
//  TextFieldKitEx.swift
//  TextFieldKit
//
//  Created by Salah on 11/18/21.
//

import Foundation
import UIKit

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
    static var emailRegix = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";

    var customLocalize_ : String {
       return NSLocalizedString(self, tableName: nil, bundle:Bundle.module ?? Bundle.main, value: "", comment: "")
   }
    public func cutomelocalizedWith(variables: CVarArg...) -> String {
        return String(format: self.customLocalize_, arguments: variables)
    }
}

extension Array where Element == FieldError {
    var valid:Bool{
        return (self.count == 0);
    }
}

public enum Fields:String{
case username="Username"
case fullName="FullName"
case password="Password"
case newPassword="NewPassword"
case confirmPassword="ConfirmPassword"
case email="Email"

var title:String{
        return self.rawValue.customLocalize_;
}
}

public enum FieldError{
case empty(_ name:String)
case notValid(_ name:String)
case passwordNotMatch
case passwordLessThan6
case other
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
    case .other:
        return ""
    }
}
}
public protocol Field{
    var field:Fields {get};
}
public protocol FieldValiadtion{
    var valid: (Bool,[FieldError]) {get};
}

protocol GeneralFieldViewProrocol{
var text:String? {set get};
var placeholder:String? {set get};
}
protocol GeneralConnection:Field,FieldValiadtion{

}
extension GeneralFieldViewProrocol where Self: GeneralConnection {
    func emptyError()->[FieldError]{
        if self.text == nil {
        return [.empty(self.field.title)]
        }
        return []
    }
}
extension GeneralFieldViewProrocol where Self: FieldValiadtion {
    func emptyError()->[FieldError]{
        if self.text == nil {
        return [.empty(self.placeholder ?? "")]
        }
        return []
    }
}
