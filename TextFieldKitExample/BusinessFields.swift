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
open class NewPasswordField:TextFieldView,FieldProrocol{
    public var title: String{
        return AppTexts.Constant.newPassword.string
    }
    public var messages:[FieldError]{
        return self.newPassword();
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
        self.txtField.isSecureTextEntry=true;
    }
}
// MARK: ConfirmPasswordField
open class ConfirmPasswordField:TextFieldView,FieldProrocol{
    public var title:String{
        return AppTexts.Constant.confirmPassword.string
    }
     @IBOutlet weak open var txtNewPasswordField: NewPasswordField?
    
    public var messages:[FieldError]{
        return self.confirmPassword(txtNewPasswordField);
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
        self.txtField.isSecureTextEntry=true;
    }
}
// MARK: PasswordField
open class PasswordField:TextFieldView,FieldProrocol{
    public var title: String{
        return AppTexts.Constant.password.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
        self.txtField.isSecureTextEntry=true;
        // secure
    }
}
// MARK: UserNameField
open class UserNameField:TextFieldView,FieldProrocol{
    public var title:String{
        return AppTexts.Constant.userName.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
    }
}
// MARK: FullNameField
open class FullNameField:TextFieldView,FieldProrocol{
    public var title:String{
        return AppTexts.Constant.fullName.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
    }
}
// MARK: EmailField
open class EmailField:TextFieldView,FieldProrocol{
    public var title:String{
        return AppTexts.Constant.email.string
    }
    public var messages:[FieldError]{
        return self.email();
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
    }
}
// MARK: TitleField
open class TitleField:TextFieldView,FieldProrocol{
    public var title: String{
        return AppTexts.Constant.title.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
    }
}
// MARK: DescriptionField
open class DescriptionField:TextViewView,FieldProrocol{
    public var title:String{
        return AppTexts.Constant.description.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
    }
}
// MARK: AddressField
open class AddressField:TextFieldView,FieldProrocol{
    public var title:String{
        return AppTexts.Constant.address.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
    }
}
// MARK: RequirementsField
open class RequirementsField:TextViewView,FieldProrocol{
    public var title:String{
        return AppTexts.Constant.requirements.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=self.title
    }
}
#if canImport(PhoneKit)
// MARK: CustomePhoneNumber
open class AdvancedPhoneNumber:PhoneNumberField,FieldProrocol{
    public var title: String{
        return AppTexts.Constant.mobileNumber.string
    }
    
    public var messages: [FieldError]{
        return self.phoneNumber();
    }
    
    open var countryObject:CountryCode?{
        didSet{
            self.countryCode = countryObject?.dial_code;
            self.flag = countryObject?.flag
        }
    }
    open var viewController:UIViewController?
    
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.viewController = self.parent;
        self.countryObject=CountryListManager.shared.currentCountry
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
open class LocationTextField:DropDownTextField,FieldProrocol{
    public var title: String{
        return AppTexts.Constant.location.string
    }
    public var messages: [FieldError]{
        return self.location();
    }
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
        self.placeholder = self.title;
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
open class CityField:DropDownTextField,FieldProrocol{
    public var title: String{
        return AppTexts.Constant.city.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
}
// MARK: RegionField
open class RegionField:DropDownTextField,FieldProrocol{
    public var title:String{
        return AppTexts.Constant.region.string
    }
    public var messages:[FieldError]{
        return self.emptyError()
    }
}


