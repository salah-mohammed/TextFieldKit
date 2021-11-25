//
//  DropDownTextField.swift
//  TextFieldKit
//
//  Created by Salah on 11/18/21.
//

import Foundation
import UIKit

open class  DropDownStyle:FieldStyle{
    public var dropDownTraling:CGFloat=16;
    public var spaceBetweenTextAndDropDownIcon:CGFloat=0

    public override init() {
        super.init()
    }
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let copy = DropDownStyle()
        return copy
    }
}
@objcMembers
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
    open override var style:FieldStyle {
            didSet {
                super.style = style
                if let style:DropDownStyle = style as? DropDownStyle{
                    self.dropDownTraling = style.dropDownTraling;
                    self.spaceBetweenTextAndDropDownIcon = style.spaceBetweenTextAndDropDownIcon;
                }
            }
        }

    open var dropDownTraling:CGFloat=16{
        didSet{
            let leading = self.stackViewDropDown.directionalLayoutMargins.leading
            self.stackViewDropDown.directionalLayoutMargins = NSDirectionalEdgeInsets.init(top: 0, leading:leading, bottom: 0, trailing: dropDownTraling)
        }
     }
    public var spaceBetweenTextAndDropDownIcon:CGFloat=0{
            didSet{
                let trailing = self.stackViewDropDown.directionalLayoutMargins.trailing
                self.stackViewDropDown.directionalLayoutMargins = NSDirectionalEdgeInsets.init(top: 0, leading:spaceBetweenTextAndDropDownIcon, bottom: 0, trailing: trailing)
            }
    }
    @IBAction func btnDropdown(_ sender:UIButton){
        dropDownHandler?(self);
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        let tempDropDownIcon = self.dropDownIcon
        self.dropDownIcon = tempDropDownIcon;
        
        let tempStyle = self.style
        self.style = tempStyle;
    }
}
