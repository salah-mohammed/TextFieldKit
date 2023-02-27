//
//  AppFields.swift
//  TextFieldKitExample
//
//  Created by Salah on 1/31/22.
//

import Foundation
import TextFieldKit
import UIKit
// this for app busines only
public class CustomCityField:DropDownTextField,FieldValiadtion{
    public var getText: (() -> String?)?

    public var title: String{
     return ""
    }
    
    var object:Any?{
        didSet{
            if let object:String = object as? String{
            self.text = object
            }
        }
    }
    public var messages:[FieldError]{
        if self.object == nil {
            return  [.required(self.placeholder ?? ""),.otherRequired("city not correct")]
        }
      return []
    }
}
