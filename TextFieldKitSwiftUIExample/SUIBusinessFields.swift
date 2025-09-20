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
open class ViewModelField: NSObject, ObservableObject, FieldProrocol {
    @Published open var text: String = ""
    @Published open var placeholder: String?
    @Published open var error: String?
    
    open func defaultValue() {
        self.text = ""
    }
    
    open var messages: [String] { return [] }
    
    open var title: String { "" }
    
    open var onEditingChanged: OnEditingValiadtionChanged?
    open var fieldDidEnd: TextFieldKit.FieldHandler?
}

open class Username: ViewModelField {
    open override var title: String {
        AppTexts.Constant.userName.string
    }
    open override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class FullName: ViewModelField {
    public override var title: String {
        AppTexts.Constant.fullName.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class FirstName: ViewModelField {
    public override var title: String {
        AppTexts.Constant.firstName.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class LastName: ViewModelField {
    public override var title: String {
        AppTexts.Constant.lastName.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class Email: ViewModelField {
    public override var title: String {
        AppTexts.Constant.email.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class Requirements: ViewModelField {
    public override var title: String {
        AppTexts.Constant.requirements.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class City: ViewModelField {
    public override var title: String {
        AppTexts.Constant.city.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class Region: ViewModelField {
    public override var title: String {
        AppTexts.Constant.region.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class Location: ViewModelField {
    public override var title: String {
        AppTexts.Constant.location.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class Address: ViewModelField {
    public override var title: String {
        AppTexts.Constant.address.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class Description: ViewModelField {
    public override var title: String {
        AppTexts.Constant.description.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class Title: ViewModelField {
    public override var title: String {
        AppTexts.Constant.title.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}

public class Password: ViewModelField {
    public override var title: String {
        AppTexts.Constant.password.string
    }
    public override var messages: [String] {
        []
    }
    public override init() {
        super.init()
        self.placeholder = self.title
    }
}
