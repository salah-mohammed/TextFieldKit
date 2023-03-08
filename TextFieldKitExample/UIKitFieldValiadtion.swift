//
//  UIKitFieldValiadtion.swift
//  TextFieldKit
//
//  Created by Salah on 1/31/22.
//

import Foundation
import TextFieldKit
import AppTexts
#if canImport(PhoneKit)
import PhoneKit
#endif
extension FieldDataProrocol where Self: FieldProrocol {
#if canImport(PhoneKit)
    func phoneNumber()->[FieldError]{
        var messages:[FieldError]=[FieldError]();
        var countryCode = (self as? AdvancedPhoneNumber)?.countryObject

        if countryCode == nil || (self.text?.isEmpty ?? true){
            messages.append(.required(self.title))
        }else
        if  CountryListManager.shared.validatePhoneNumber(countryCode: countryCode, phoneNumber: self.text) == false {
            messages.append(.notValid(self.title))
        }
     return messages
    }
#endif
#if canImport(LocationPicker)
    func location()->[FieldError]{
    var messages:[FieldError]=[FieldError]();
        let locationItem = (self as? LocationTextField)?.locationItem
        if locationItem == nil || (self.text?.isEmpty ?? true){
            messages.append(.required(self.title))
        }
        return messages;
    }
#endif
    func confirmPassword(_ txtNewPasswordField:NewPasswordField?)->[FieldError]{
        var messages:[FieldError]=[FieldError]();
        if ((self.text?.count ?? 0) == 0) || (self.text?.isEmpty ?? true){
            messages.append(.required(self.title))
        }else
        if txtNewPasswordField?.text != self.text {
            messages.append(.otherRequired(AppTexts.Constant.passwordNotMatch.string))
        }
        return messages;
    }
}
//extension GeneralFieldViewProrocol where Self: FieldValiadtion {
//    // validation
//    func emptyError()->[FieldError]{
//        if ((self.text?.count ?? 0) == 0)  || (self.text?.isEmpty ?? true){
//            return [.fieldRequired(self.placeholder ?? "")]
//        }
//        return []
//    }
//}
