//
//  FieldValiadtion.swift
//  TextFieldKit
//
//  Created by Salah on 1/31/22.
//

import Foundation
#if canImport(PhoneKit)
import PhoneKit
#endif
extension GeneralFieldViewProrocol where Self: GeneralConnection {
    func emptyError()->[FieldError]{
        if ((self.text?.count ?? 0) == 0) || (self.text?.isEmpty ?? true) {
        return [.empty(self.fieldType.title)]
        }
        return []
    }
    func newPassword()->[FieldError]{
        var messages:[FieldError]=[FieldError]();
        if ((self.text?.count ?? 0) == 0) ||  (self.text?.isEmpty ?? true){
            messages.append(.empty(self.fieldType.title))
        }else
        if (self.text?.count ?? 0) < 6 {
            messages.append(.passwordLessThan6)
        }
        return messages;
    }
    func confirmPassword(_ txtNewPasswordField:NewPasswordField?)->[FieldError]{
        var messages:[FieldError]=[FieldError]();
        if ((self.text?.count ?? 0) == 0) || (self.text?.isEmpty ?? true){
            messages.append(.empty(self.fieldType.title))
        }else
        if txtNewPasswordField?.text != self.text {
            messages.append(.passwordNotMatch)
        }
        return messages;
    }
    func email()->[FieldError]{
        var messages:[FieldError]=[FieldError]();
        if ((self.text?.count ?? 0) == 0) || (self.text?.isEmpty ?? true){
            messages.append(.empty(self.fieldType.title))
        }else
        if  RegularExpression.email.regex.matches(input: self.text ?? "")==false {
            messages.append(.notValid(self.fieldType.title))
    }
     return messages
    }
#if canImport(PhoneKit)
    func phoneNumber()->[FieldError]{
        var messages:[FieldError]=[FieldError]();
        var countryCode = (self as? AdvancedPhoneNumber)?.countryObject

        if countryCode == nil || (self.text?.isEmpty ?? true){
            messages.append(.empty(self.fieldType.title))
        }else
        if  CountryListManager.shared.validatePhoneNumber(countryCode: countryCode, phoneNumber: self.text) == false {
            messages.append(.notValid(self.fieldType.title))
        }
     return messages
    }
#endif
#if canImport(LocationPicker)
    func location()->[FieldError]{
    var messages:[FieldError]=[FieldError]();
        let locationItem = (self as? LocationTextField)?.locationItem
        if locationItem == nil || (self.text?.isEmpty ?? true){
            messages.append(.empty(self.fieldType.title))
        }
        return messages;
    }
#endif
}
extension GeneralFieldViewProrocol where Self: FieldValiadtion {
    // validation
    func emptyError()->[FieldError]{
        if ((self.text?.count ?? 0) == 0)  || (self.text?.isEmpty ?? true){
        return [.empty(self.placeholder ?? "")]
        }
        return []
    }
}
