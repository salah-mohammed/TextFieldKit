//
//  DropDownTextField.swift
//  TextFieldKit
//
//  Created by Salah on 11/18/21.
//

import Foundation
import UIKit
open class DropDownTextField: TextFieldView {
    typealias DropDownHandler = (()->Void)
    @IBOutlet weak private var imgDropDown: UIImageView!
    @IBOutlet weak private var btnDropDown: UIButton!
    var dropDownHandler:DropDownHandler?
    
    open var dropDownIcon:UIImage?{
         didSet{
            self.imgDropDown.image=icon;
            self.imgDropDown.superview?.isHidden = (self.imgDropDown.image == nil)
         }
     }
    @IBAction func btnDropdown(_ sender:UIButton){
        dropDownHandler?();
    }
    
}
