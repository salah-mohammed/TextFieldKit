//
//  FieldValidation.swift
//  TextFieldKitExample
//
//  Created by SalahMohamed on 09/02/2023.
//

import UIKit
import TextFieldKit
import AppTexts
public extension GeneralFieldViewProrocol where Self: GeneralConnection {
     func emptyError()->[FieldError]{
        if ((self.text?.count ?? 0) == 0) || (self.text?.isEmpty ?? true) {
            return [.required(self.title)]
        }
        return []
    }
     func newPassword()->[FieldError]{
        var messages:[FieldError]=[FieldError]();
        if ((self.text?.count ?? 0) == 0) ||  (self.text?.isEmpty ?? true){
            messages.append(.required(self.title))
        }else
        if (self.text?.count ?? 0) < 6 {
            messages.append(.otherRequired(AppTexts.PasswordMustHave6))
        }
        return messages;
    }
     func email()->[FieldError]{
        var messages:[FieldError]=[FieldError]();
        if ((self.text?.count ?? 0) == 0) || (self.text?.isEmpty ?? true){
            messages.append(.required(self.title))
        }else
        if  RegularExpression.email.regex.matches(input: self.text ?? "")==false {
            messages.append(.notValid(self.title))
        }
        return messages
    }
}
