//
//  TextFieldProtocols.swift
//  TextFieldKit
//
//  Created by Salah on 9/30/22.
//

import Foundation
// MARK: FieldValiadtion
public protocol FieldValiadtionProrocol:NSObject{
    var messages:[FieldError] {get};
    var title:String{get};
    var error:String?{set get};
}
// MARK: FieldDataProrocol->Field ViewModel
public protocol FieldDataProrocol:NSObject{
var text:String? {set get};
var placeholder:String? {set get};
var error:String?{set get};
var fieldDidEnd:FieldHandler?{set get}
// for swiftUI
var onEditingChanged:OnEditingValiadtionChanged?{set get}
}
// MARK: FieldStyleProrocol
public protocol FieldStyleProrocol{
     // for style
     func cutomLayoutSubviews();
     func selectedStyle();
     func normalStyle();
     func filledStyle();
     var nibName:String { get}
     var field:Field?{set get}
}
// MARK: FieldProrocol
public protocol FieldProrocol:FieldDataProrocol,FieldValiadtionProrocol{

}
//public protocol SUIGeneralConnection:SUIField,FieldValiadtion{
////    var handler:((Bool,FieldValiadtion) -> Void)
//}
