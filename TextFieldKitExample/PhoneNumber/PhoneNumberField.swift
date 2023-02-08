//
//  PhoneNumberField.swift
//  CheckBoxSelectionKitExample
//
//  Created by Salah on 9/22/20.
//  Copyright © 2020 Salah. All rights reserved.
//


import UIKit
import AppTexts
import TextFieldKit
@IBDesignable
open class PhoneNumberField: TextFieldView {
    open override var nibName: String{
        return "PhoneNumberField";
    }
    public typealias CountryPickerHandler = ((PhoneNumberField)->Void)
    public var countryPickerHandler:CountryPickerHandler?

    @IBOutlet weak  var imgFlag: UIImageView!
    @IBOutlet weak  var lblCountryCode:UILabel!
    @IBOutlet weak  var btnCountryCode:UIButton!

    open var countryCodeColor:UIColor?{
         didSet{
             self.lblCountryCode.textColor = countryCodeColor;
         }
     }
    open var flag:UIImage?{
         didSet{
            self.imgFlag.image=flag;
            self.imgFlag.superview?.isHidden = (self.imgFlag.image == nil)
         }
     }
    open var countryCode:String?{
         didSet{
             self.lblCountryCode.text=countryCode;
         }
     }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.placeholder=AppTexts.PhoneNumber;
        self.txtField.delegate=self;
        let tempFlag = self.flag
        self.flag = tempFlag;
        let tempCountryCode = self.countryCode
        self.countryCode = tempCountryCode;
        let tempCountryCodeColor = self.countryCodeColor ?? UIColor(named:"CountryCode")
        self.countryCodeColor = tempCountryCodeColor;
    }
    @IBAction func btnCountryCode(_ sender:UIButton){
        countryPickerHandler?(self);
    }
}
extension PhoneNumberField:UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 11
    }
}
