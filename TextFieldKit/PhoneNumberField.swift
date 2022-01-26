//
//  PhoneNumberField.swift
//  CheckBoxSelectionKitExample
//
//  Created by Salah on 9/22/20.
//  Copyright © 2020 Salah. All rights reserved.
//


import UIKit

@IBDesignable
open class PhoneNumberField: TextFieldView {
    override var nibName: String{
        return "PhoneNumberField";
    }
    public typealias CountryPickerHandler = ((PhoneNumberField)->Void)
    public var countryPickerHandler:CountryPickerHandler?

    @IBOutlet weak private var imgFlag: UIImageView!
    @IBOutlet weak private var lblCountryCode:UILabel!
    @IBOutlet weak private var btnCountryCode:UIButton!

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
        self.placeholder="PhoneNumber".customLocalize_;
        self.txtField.delegate=self;
        let tempFlag = self.flag
        self.flag = tempFlag;
        let tempCountryCode = self.countryCode
        self.countryCode = tempCountryCode;
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
