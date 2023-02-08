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


public class Username:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .username
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class FullName:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .fullName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class FirstName:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .firstName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class LastName:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .lastName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Email:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .email
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Requirements:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .requirements
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class City:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .city
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Region:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .region
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Location:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .location
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Address:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .address
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Description:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .description
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Title:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .title
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Password:NSObject,GeneralConnection{
    public var error: String?
    
    public var fieldType: TextFieldKit.FieldType{
        return .password
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
//case newPassword="NewPassword"
//case confirmPassword="ConfirmPassword"
