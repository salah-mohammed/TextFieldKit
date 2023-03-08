//
//  Field.swift
//  TextFieldKit
//
//  Created by SalahMohamed on 08/03/2023.
//

import UIKit

open class Field:NSObject,FieldProrocol{
    @objc dynamic open var text: String?
    
    open var placeholder: String?
    
    @objc dynamic open var error: String?
     
    open var fieldDidEnd: FieldHandler?
    
    open var onEditingChanged: OnEditingValiadtionChanged?
    
    open var messages: [FieldError]{
      return []
    }

    open var title: String{return ""}

//    public func set(_ sender:inout UIView?)->Self {
//        sender?.field=self
//        return self
//    }
    public override init() {
        super.init()
    }
}
