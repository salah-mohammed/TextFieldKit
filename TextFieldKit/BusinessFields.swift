//
//  BusinessFields.swift
//  TextFieldKit
//
//  Created by Salah on 1/9/22.
//

import Foundation

// MARK: NewPasswordField
open class NewPasswordField:TextFieldView,GeneralConnection{
    public var fieldType: FieldType{
        return .newPassword
    }
    public var valid:[FieldError]{
        return self.newPassword();
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
        self.txtField.isSecureTextEntry=true;
    }
}
// MARK: ConfirmPasswordField
open class ConfirmPasswordField:TextFieldView,GeneralConnection{
    public var fieldType: FieldType{
        return .confirmPassword
    }
    @IBOutlet weak open var txtNewPasswordField: NewPasswordField?
    
    public var valid:[FieldError]{
        return self.confirmPassword(txtNewPasswordField);
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
        self.txtField.isSecureTextEntry=true;
    }
}
// MARK: PasswordField
open class PasswordField:TextFieldView,GeneralConnection{
    public var fieldType: FieldType{
        return .password
    }
    public var valid:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
        self.txtField.isSecureTextEntry=true;
        // secure
    }
}
// MARK: UserNameField
open class UserNameField:TextFieldView,GeneralConnection{
    public var fieldType: FieldType{
        return .username
    }
    public var valid:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
    }
}
// MARK: FullNameField
open class FullNameField:TextFieldView,GeneralConnection{
    public var fieldType: FieldType{
        return .fullName
    }
    public var valid:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
    }
}
// MARK: EmailField
open class EmailField:TextFieldView,GeneralConnection{
    public var fieldType: FieldType{
        return .email
    }
    public var valid:[FieldError]{
        return self.email();
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
    }
}
// MARK: TitleField
open class TitleField:TextFieldView,GeneralConnection{
    public var fieldType: FieldType{
        return .title
    }
    public var valid:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
    }
}
// MARK: DescriptionField
open class DescriptionField:TextViewView,GeneralConnection{
    public var fieldType: FieldType{
        return .description
    }
    public var valid:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
    }
}
// MARK: AddressField
open class AddressField:TextFieldView,GeneralConnection{
    public var fieldType: FieldType{
        return .address
    }
    public var valid:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
    }
}
// MARK: RequirementsField
open class RequirementsField:TextViewView,GeneralConnection{
    public var fieldType: FieldType{
        return .requirements
    }
    public var valid:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.fieldType.title
    }
}

// MARK: CutomeDropDownTextField
open class CutomeDropDownTextField:DropDownTextField,FieldValiadtion{
    public var valid:[FieldError]{
        return self.emptyError()
    }
}
// MARK: CutomeTextView
open class CutomeTextView:TextFieldView,FieldValiadtion{
    public var valid:[FieldError]{
        return self.emptyError()
    }
}


