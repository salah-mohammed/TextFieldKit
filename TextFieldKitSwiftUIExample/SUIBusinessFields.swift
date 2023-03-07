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
    public var onEditingChanged:OnEditingValiadtionChanged?
    public var fieldDidEnd: TextFieldKit.FieldHandler?

}
public class Username:BaseValidation,GeneralConnection{
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?
    public var getText: (() -> String?)?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.userName.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
//    public func onEditingChanged()->OnEditingValiadtionChanged{
//        return { value,validation  in
//            if value == false{
//                self.error = validation?.messages.string ?? "";
//            }
//        }
//    }
}
public class FullName:BaseValidation,GeneralConnection{
    public var getText: (() -> String?)?
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.fullName.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }
}
public class FirstName:BaseValidation,GeneralConnection{
    public var getText: (() -> String?)?
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.firstName.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }

}
public class LastName:BaseValidation,GeneralConnection{
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?
    public var getText: (() -> String?)?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.lastName.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }

}
public class Email:BaseValidation,GeneralConnection{
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?
    public var getText: (() -> String?)?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.email.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.email()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }

}
public class Requirements:BaseValidation,GeneralConnection{
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?
    public var getText: (() -> String?)?

    
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.requirements.string()
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }

}
public class City:BaseValidation,GeneralConnection{
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?
    public var getText: (() -> String?)?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.city.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }

}
public class Region:BaseValidation,GeneralConnection{
    public var getText: (() -> String?)?
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.region.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }

}
public class Location:BaseValidation,GeneralConnection{
    public var getText: (() -> String?)?
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?
    
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.location.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }

}
public class Address:BaseValidation,GeneralConnection{
    public var getText: (() -> String?)?
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?
    
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.address.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
        self.placeholder=self.title
    }

}
public class Description:BaseValidation,GeneralConnection{
    public var getText: (() -> String?)?
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?
    
    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.description.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }

}
public class Title:BaseValidation,GeneralConnection{
    public var getText: (() -> String?)?
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.title.string()
    }
    public var messages: [TextFieldKit.FieldError]{
        return self.emptyError()
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }

}
public class Password:BaseValidation,GeneralConnection{
    public var getText: (() -> String?)?
    
    public var fieldValiadtion: TextFieldKit.FieldValiadtion?

    @Published public var text:String?
    @Published public var placeholder: String?
    @Published public var error: String?

    public var title: String{
        return AppTexts.Constant.password.string()
    }
    public var messages: [TextFieldKit.FieldError]{
    return []
    }
    public override init() {
        super.init()
    self.placeholder=self.title
    }

}
