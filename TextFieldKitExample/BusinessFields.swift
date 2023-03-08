//
//  BusinessFields.swift
//  TextFieldKit
//
//  Created by Salah on 1/9/22.
//

import Foundation
import TextFieldKit
import AppTexts
#if canImport(PhoneKit)
import PhoneKit

#endif
#if canImport(LocationPicker)
import LocationPicker
#endif

// MARK: NewPasswordField
open class NewPasswordField:TextFieldView{
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.txtField.isSecureTextEntry=true;
        
    }
}
// MARK: ConfirmPasswordField
open class ConfirmPasswordField:TextFieldView{
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.txtField.isSecureTextEntry=true;
    }
}
// MARK: PasswordField
open class PasswordField:TextFieldView{
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.txtField.isSecureTextEntry=true;
        // secure
    }
}
// MARK: UserNameField
open class UserNameField:TextFieldView{
    open override func awakeFromNib() {
        super.awakeFromNib();
    }
}
// MARK: FullNameField
open class FullNameField:TextFieldView{
    open override func awakeFromNib() {
        super.awakeFromNib();
    }
}
// MARK: EmailField
open class EmailField:TextFieldView{
    open override func awakeFromNib() {
        super.awakeFromNib();
    }
}
// MARK: TitleField
open class TitleField:TextFieldView{
    open override func awakeFromNib() {
        super.awakeFromNib();
    }
}
// MARK: DescriptionField
open class DescriptionField:TextViewView{
    open override func awakeFromNib() {
        super.awakeFromNib();
    }
}
// MARK: AddressField
open class AddressField:TextFieldView{
    open override func awakeFromNib() {
        super.awakeFromNib();
    }
}
// MARK: RequirementsField
open class RequirementsField:TextViewView{
    open override func awakeFromNib() {
        super.awakeFromNib();
    }
}
#if canImport(PhoneKit)
// MARK: CustomePhoneNumber
open class AdvancedPhoneNumber:PhoneNumberField{
    open override var field: Field?{
        didSet{
            self.countryObject=CountryListManager.shared.currentCountry
        }
    }
    open var countryObject:CountryCode?{
        set{
            self.countryCode = newValue?.dial_code;
            self.flag = newValue?.flag
            (self.field as? AdvancedPhoneNumberValidation)?.countryObject = newValue
        }
        get{
        return (self.field as? AdvancedPhoneNumberValidation)?.countryObject
        }
    }
    open var viewController:UIViewController?
    
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.viewController = self.parent;
        self.countryPickerHandler = { textfield in
            UIAlertController.showCountryPicker(self,self.viewController) { (object) in
                self.countryObject = object;
            } cancelHandler: {
            }
        }
    }
    
}
#endif
#if canImport(LocationPicker)
open class LocationTextField:DropDownTextField{
    
    public var locationItem:LocationItem?{
        didSet{
            self.text = locationItem?.title ?? locationItem?.subtitle ?? self.locationItem?.coordinate?.lp_stringValue ?? ""
        }
    }
    open var viewController:UIViewController?

    open var success: LocationPickerViewController.successClosure?
    open var failure: LocationPickerViewController.failureClosure?
    open var cancel: LocationPickerViewController.cancelClosure?
    var locationPicker:LocationPickerViewController?
    
    open override func awakeFromNib(){
        super.awakeFromNib();
        self.viewController = self.parent;
        self.dropDownHandler = { textfield in
            if let vc:LocationPickerViewController = LocationPickerViewController.initPicker(self.locationItem, nil){
                vc.failure = self.failure;
                vc.cancel = self.cancel;
                vc.cancel = { 
                    vc.dismiss(animated: true, completion: nil);
                    self.cancel?();
                }
                vc.success = { (item,enable) in
                    self.locationItem=item;
                    self.success?(item,enable);
                    vc.dismiss(animated: true, completion: nil);
                }
                self.viewController?.present(vc, animated: true, completion: nil);
            }
        }
    }
}
#endif

// MARK: CityField
open class CityField:DropDownTextField{
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
}
// MARK: RegionField
open class RegionField:DropDownTextField{

    open override func awakeFromNib() {
        super.awakeFromNib()
    }
}

/**----------------------------------------------------------------------------------------------------------------------------**/

// MARK: NewPasswordField
open class NewPasswordValidation:Field{

    public override var title: String{
        return AppTexts.Constant.newPassword.string
    }
    public override var messages:[FieldError]{
        return self.newPassword();
    }
}
// MARK: ConfirmPasswordField
open class ConfirmPasswordFieldValidation:Field{
    
    public override var title:String{
        return AppTexts.Constant.confirmPassword.string
    }
    var newPasswordValidation:NewPasswordValidation?
    
    public override var messages:[FieldError]{
        return self.confirmPassword(newPasswordValidation);
    }
    init(_ newPasswordValidation: NewPasswordValidation? = nil) {
        self.newPasswordValidation = newPasswordValidation
    }
}
// MARK: PasswordField
open class PasswordFieldValidation:Field{
    public override var title: String{
        return AppTexts.Constant.password.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}
// MARK: UserNameField
open class UserNameFieldValidation:Field{
    
    public override var title:String{
        return AppTexts.Constant.userName.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}
// MARK: FullNameField
open class FullNameFieldValidation:Field{
    
    public override var title:String{
        return AppTexts.Constant.fullName.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}
// MARK: EmailField
open class EmailFieldValidation:Field{
    
    public override var title:String{
        return AppTexts.Constant.email.string
    }
    public override var messages:[FieldError]{
        return self.email();
    }
}
// MARK: TitleField
open class TitleFieldValidation:Field{
    
    public override var title: String{
        return AppTexts.Constant.title.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}
// MARK: DescriptionField
open class DescriptionFieldValidation:Field{
    
    public override var title:String{
        return AppTexts.Constant.description.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}
// MARK: AddressField
open class AddressFieldValidation:Field{
    
    public override var title:String{
        return AppTexts.Constant.address.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}
// MARK: RequirementsField
open class RequirementsFieldValidation:Field{
    
    public override var title:String{
        return AppTexts.Constant.requirements.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}
#if canImport(PhoneKit)
// MARK: CustomePhoneNumber
open class AdvancedPhoneNumberValidation:Field{
    var countryObject:CountryCode?
    public  override var title: String{
        return AppTexts.Constant.mobileNumber.string
    }
    public  override var messages: [FieldError]{
        return []
    }
}
#endif
#if canImport(LocationPicker)
open class LocationTextFieldValidation:Field{
    public override var title: String{
        return AppTexts.Constant.location.string
    }
    public override var messages: [FieldError]{
        return self.location();
    }
}
#endif

// MARK: CityField
open class CityFieldValidation:Field{
    public override var title: String{
        return AppTexts.Constant.city.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}
// MARK: RegionField
open class RegionFieldValidation:Field{
    
    public override var title:String{
        return AppTexts.Constant.region.string
    }
    public override var messages:[FieldError]{
        return self.emptyError()
    }
}


//
