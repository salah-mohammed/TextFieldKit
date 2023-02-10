//
//  TextFieldProtocols.swift
//  TextFieldKit
//
//  Created by Salah on 9/30/22.
//

import Foundation
// MARK: FieldValiadtion
public protocol FieldValiadtion:NSObject{
    var messages:[FieldError] {get};
    var title:String{get};
    var error:String?{set get};
}
// MARK: GeneralFieldViewProrocol
public protocol GeneralFieldViewProrocol:NSObject{
var text:String? {set get};
var placeholder:String? {set get};
var error:String?{set get};
    
var fieldDidEnd:FieldHandler?{set get}
var onEditingChanged:OnEditingValiadtionChanged?{set get}
}
public protocol FieldStyleProrocol{
    
     // for style
     func cutomLayoutSubviews();
     func selectedStyle();
     func normalStyle();
     func filledStyle();
     var nibName:String { get}

}
// MARK: GeneralConnection
public protocol GeneralConnection:GeneralFieldViewProrocol,FieldValiadtion{

}
//public protocol SUIGeneralConnection:SUIField,FieldValiadtion{
////    var handler:((Bool,FieldValiadtion) -> Void)
//}
