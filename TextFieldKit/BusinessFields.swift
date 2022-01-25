//
//  BusinessFields.swift
//  TextFieldKit
//
//  Created by Salah on 1/9/22.
//

import Foundation

open class NewPasswordField:TextFieldView,FieldValiadtion,Field{
    public var field: Fields{
        return .newPassword
    }
    public var valid: (Bool, [FieldError]){
        var messages:[FieldError]=[FieldError]();
        if self.text == nil {
            messages.append(.empty(self.field.title))
        }
        return (messages.valid,messages)
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.field.title
        self.txtField.isSecureTextEntry=true;
    }
}
open class ConfirmPasswordField:TextFieldView,FieldValiadtion,Field{
    public var field: Fields{
        return .confirmPassword
    }
    @IBOutlet weak open var txtNewPasswordField: NewPasswordField?
    
    public var valid: (Bool, [FieldError]){
        var messages:[FieldError]=[FieldError]();
        if self.text == nil {
            messages.append(.empty(self.field.title))
        }
        if self.txtNewPasswordField?.text != self.text {
            messages.append(.passwordNotMatch)
        }
        return (messages.valid,messages)
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.field.title
        self.txtField.isSecureTextEntry=true;
    }
}
open class PasswordField:TextFieldView,FieldValiadtion,Field{
    public var field: Fields{
        return .password
    }
    public var valid: (Bool, [FieldError]){
        var messages:[FieldError]=[FieldError]();
        if self.text == nil {
            messages.append(.empty(self.field.title))
        }else
        if (self.text?.count ?? 0) < 6 {
            messages.append(.passwordLessThan6)
        }
        return (messages.valid,messages)
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.field.title
        self.txtField.isSecureTextEntry=true;
        // secure
    }
}
open class UserNameField:TextFieldView,FieldValiadtion,Field{
    public var field: Fields{
        return .username
    }
    public var valid: (Bool, [FieldError]){
        var messages:[FieldError]=[FieldError]();
        messages.append(contentsOf: self.emptyError());
        return (messages.valid,messages)
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.field.title
    }
}
open class FullNameField:TextFieldView,FieldValiadtion,Field{
    public var field: Fields{
        return .fullName
    }
    public var valid: (Bool, [FieldError]){
        var messages:[FieldError]=[FieldError]();
        messages.append(contentsOf: self.emptyError());
        return (messages.valid,messages)
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.field.title
    }
}
open class EmailField:TextFieldView,FieldValiadtion,Field{
    public var field: Fields{
        return .email
    }
    public var valid: (Bool, [FieldError]){
        var messages:[FieldError]=[FieldError]();
        if self.text == nil {
            messages.append(.empty(self.field.title))
        }else
        if Regex.init(String.emailRegix).matches(input:self.text ?? "") == false{
            messages.append(.notValid(self.field.title))
        }
        return (messages.valid,messages)
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.field.title
    }
}

open class CutomeDropDownTextField:DropDownTextField,FieldValiadtion{
    public var valid: (Bool, [FieldError]){
        var messages:[FieldError]=[FieldError]();
        messages.append(contentsOf: self.emptyError());
        return (messages.valid,messages)
    }
}
open class CutomeTextView:TextFieldView,FieldValiadtion{
    public var valid: (Bool, [FieldError]){
        var messages:[FieldError]=[FieldError]();
        messages.append(contentsOf: self.emptyError());
        return (messages.valid,messages)
    }
}

