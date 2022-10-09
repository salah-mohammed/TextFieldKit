//
//  SUIBusinessFields.swift
//  TextFieldKit
//
//  Created by Salah on 10/8/22.
//

import UIKit
import SwiftUI
//@available(iOS 16.0, *)
//public struct SUIUserNameField:SUITextFieldView {
//    public var body: some View {
//        ZStack{
//
//        }
//    }
//    public var fieldType: FieldType{
//        return .username
//    }
//    public var messages:[FieldError]{
//        return []//self.emptyError()
//    }
//    public var body: some View {
//        return super
//    }
  
//}
//        self.placeholder=self.fieldType.title

//GeneralConnection
// struct A2: View {
//     var body: some View {
//            ZStack{
//
//            }
//        }
    
    
//}
// struct A3: A2 {
//     var body: some View {
//        ZStack{
//
//        }
//    }
//}

//@available(iOS 16.0, *)
//struct TextFieldModifier: ViewModifier {
//    var view:SUITextFieldView
//    var fieldType: GeneralConnection
//    
//    init(view:SUITextFieldView,fieldType:GeneralConnection) {
//        self.view = view
//        self.fieldType=fieldType
//    }
//
//    func body(content: Content) -> some View {
////        view.onAppear(perform:{
////            self.view.placeholder="aa";
////        })
//        content
//    }
//}
//@available(iOS 16.0, *)
//extension SUITextFieldView {
//     public func validation(_ validationType:GeneralConnection) -> some View {
//         self.modifier(TextFieldModifier.init(view:self, fieldType: validationType))
//    }
//
//}


public class Username:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .username
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class FullName:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .fullName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class FirstName:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .firstName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class LastName:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .lastName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class Email:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .email
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class Requirements:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .requirements
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class City:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .city
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class Region:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .region
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class Location:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .location
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class Address:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .address
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class Description:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .description
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class Title:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .title
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
public class Password:GeneralConnection{
    public var fieldType: TextFieldKit.FieldType{
        return .password
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public init() {
        
    }
}
//case newPassword="NewPassword"
//case confirmPassword="ConfirmPassword"
