//
//  DropDownTextField.swift
//  TextFieldKit
//
//  Created by Salah on 11/18/21.
//

import Foundation
import UIKit
open class DropDownTextField: TextFieldView {
    public typealias DropDownHandler = ((DropDownTextField)->Void)
    @IBOutlet weak private var imgDropDown: UIImageView!
    @IBOutlet weak private var btnDropDown: UIButton!
    @IBOutlet weak private var stackViewDropDown: UIStackView!

    public var dropDownHandler:DropDownHandler?
    
    open var dropDownIcon:UIImage?{
         didSet{
            self.imgDropDown.image=dropDownIcon;
            self.imgDropDown.superview?.isHidden = (self.imgDropDown.image == nil)
         }
     }
    open var dropDownTraling:CGFloat=16{
        didSet{
            self.stackViewDropDown.layoutMargins = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: dropDownTraling)
        }
     }
    @IBAction func btnDropdown(_ sender:UIButton){
        dropDownHandler?(self);
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        let tempDropDownIcon = self.dropDownIcon
        self.dropDownIcon = tempDropDownIcon;
        
        let tempDropDownTraling = self.dropDownTraling
        self.dropDownTraling = tempDropDownTraling;
    }
}
