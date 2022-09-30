//
//  TextFieldProtocols.swift
//  TextFieldKit
//
//  Created by Salah on 9/30/22.
//

import Foundation

// MARK: Field
public protocol Field{
    var fieldType:FieldType {get};
}
// MARK: FieldValiadtion
public protocol FieldValiadtion{
    var messages:[FieldError] {get};
}
// MARK: GeneralFieldViewProrocol
public protocol GeneralFieldViewProrocol{
var text:String? {set get};
var placeholder:String? {set get};
var error:String? {set get};
}
public protocol CutomFieldProrocol{
    func selectedStyle();
     func normalStyle();
     func filledStyle();
     func cutomLayoutSubviews()
     var nibName:String { get}

}
// MARK: GeneralConnection
protocol GeneralConnection:Field,FieldValiadtion{

}
