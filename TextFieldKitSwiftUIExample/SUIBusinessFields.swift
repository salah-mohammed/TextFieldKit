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
public class BaseValidation:NSObject,ObservableObject{
    
}
public class Username:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.UserName
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class FullName:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.FullName
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class FirstName:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.FirstName
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class LastName:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.LastName
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class Email:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Email
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.email()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class Requirements:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Requirements
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class City:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.City
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class Region:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Region
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }
}
public class Location:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Location
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }
}
public class Address:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Address
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class Description:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Description
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }
}
public class Title:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Title
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }
}
public class Password:BaseValidation,GeneralConnection,GeneralFieldViewProrocol{
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Password
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }
}
//case newPassword="NewPassword"
//case confirmPassword="ConfirmPassword"
