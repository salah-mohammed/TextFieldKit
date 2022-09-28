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
class CustomCityField:DropDownTextField,FieldValiadtion{
    var object:Any?{
        didSet{
            if let object:String = object as? String{
            self.text = object
            }
        }
    }
    var messages:[FieldError]{
        if self.object == nil {
            return  [.empty(self.placeholder ?? ""),.other("dasdsad")]
        }
      return []
    }
//    func textFieldDidEnd(_ txt:UITextField){
//        super.textFieldDidEnd(txt);
//    }
}
