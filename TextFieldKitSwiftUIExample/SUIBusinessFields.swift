//
//  SUIBusinessFields.swift
//  TextFieldKit
//
//  Created by Salah on 10/8/22.
//

import UIKit
import SwiftUI
import TextFieldKit
import AppTexts
public class Username:NSObject,GeneralConnection,ObservableObject{
    @Published var text:String?

    public var title: String{
        return AppTexts.UserName
    }
    public var messages: [TextFieldKit.FieldError]{
        if self.text?.isEmpty ?? true{
            return [.fieldRequired(self.title)]
        }
        return []
    }
    public override init() {
        super.init()
    }
    public  init(text:String?) {
        self.text=text
    }
}
public class FullName:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.FullName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class FirstName:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.FirstName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class LastName:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.LastName
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Email:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.Email
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Requirements:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.Requirements
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class City:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.City
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Region:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.Region
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Location:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.Location
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Address:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.Address
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Description:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.Description
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Title:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.Title
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    }
}
public class Password:NSObject,GeneralConnection{
    public var title: String{
        return AppTexts.Password
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
