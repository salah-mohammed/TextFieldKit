//
//  AppStyle.swift
//  TextFieldKitExample
//
//  Created by Salah on 10/7/22.
//

import UIKit
import TextFieldKit
class AppStyle {
    public static var placeholder: UIColor {
          return UIColor.init(red: 0, green: 0, blue: 0.0980392, alpha: 0.22);
  }
    static var dropDownStyle:DropDownStyle = {
        var fieldStyle = DropDownStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 1.0
        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        fieldStyle.dropDownTraling = 16;
        fieldStyle.spaceBetweenTextAndDropDownIcon = 0
        return fieldStyle;
    }()
    
    static var textViewStyle:TextViewStyle = {
        var fieldStyle = TextViewStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 1.0
        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        fieldStyle.spaceBetweenTitleAndField = .auto;
        return fieldStyle;
    }()
    static var textFieldStyle:FieldStyle = {
        var fieldStyle = FieldStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 1.0
        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        return fieldStyle;
    }()
    /////////
    static var dropDownStyl2:DropDownStyle = {
        var fieldStyle = DropDownStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 1.0
        fieldStyle.selected = FieldColorStyle.init(.orange,.orange,.orange)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        fieldStyle.dropDownTraling = 16;
        fieldStyle.spaceBetweenTextAndDropDownIcon = 0
        return fieldStyle;
    }()
    
    static var textViewStyle2:TextViewStyle = {
        var fieldStyle = TextViewStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 1.0
        fieldStyle.selected = FieldColorStyle.init(.orange,.orange,.orange)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        fieldStyle.spaceBetweenTitleAndField = .auto;
        return fieldStyle;
    }()
    static var textFieldStyle2:FieldStyle = {
        var fieldStyle = FieldStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 1.0
        fieldStyle.selected = FieldColorStyle.init(.orange,.orange,.orange)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        return fieldStyle;
    }()
}
