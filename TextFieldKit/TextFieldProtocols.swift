//
//  TextFieldProtocols.swift
//  TextFieldKit
//
//  Created by Salah on 9/30/22.
//

import Foundation

// MARK: Field
public protocol Field{
    var title:String{get};
}
//public protocol SUIField:ObservableObject{
//    var fieldType:FieldType {get};
//}
@objc protocol ObjcPrintable {
    @objc optional func canPrint() -> Bool
}
// MARK: FieldValiadtion
public protocol FieldValiadtion:NSObject{
    var messages:[FieldError] {get};
}
// MARK: GeneralFieldViewProrocol
public protocol GeneralFieldViewProrocol:NSObject{
var text:String? {set get};
var placeholder:String? {set get};
var error:String?{set get};
}
public protocol CutomFieldProrocol{
    
     // for style
     func cutomLayoutSubviews();
     func selectedStyle();
     func normalStyle();
     func filledStyle();
     var nibName:String { get}

}
// MARK: GeneralConnection
public protocol GeneralConnection:Field,FieldValiadtion{
#if canImport(SwiftUI)
    func onEditingChanged()->OnEditingValiadtionChanged;
#endif
}
//public protocol SUIGeneralConnection:SUIField,FieldValiadtion{
////    var handler:((Bool,FieldValiadtion) -> Void)
//}
