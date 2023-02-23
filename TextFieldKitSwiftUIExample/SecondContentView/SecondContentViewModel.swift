//
//  SecondContentViewModel.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/8/22.
//

import UIKit
import SwiftUI
import TextFieldKit

typealias Item = ObservableObject

public class BaseViewModel:NSObject,ObservableObject{
    private var nestedObservableObjects:[Any]=[Any]()
    public override init() {
        super.init();
    }
    func appendNested(_ element:BaseValidation){
        let value = element.objectWillChange.sink { [weak self] (_) in
            self?.objectWillChange.send()
        }
        self.nestedObservableObjects.append(value)
    }
}

public class SecondContentViewModel:BaseViewModel{
    @Published public var userNameValidation = Username()
    @Published public var fullNameValidation = FullName()
    @Published public var firstNameValidation = FirstName()
    @Published public var requirementsValidation = Requirements()
    @Published public var emailValidation = Email()
    public var fieldsManager:FieldsManager = FieldsManager();
    
    var companyFields:[FieldValiadtion]{
    return [
        userNameValidation,
        fullNameValidation]
    }
    var allFields:[FieldValiadtion]{
    return [
        userNameValidation,
        fullNameValidation,
        firstNameValidation,
        requirementsValidation,
        emailValidation]
    }
    public override init() {
        super.init();
        self.appendNested(userNameValidation);
        self.appendNested(fullNameValidation);
        self.appendNested(firstNameValidation);
        self.appendNested(requirementsValidation);
        self.appendNested(emailValidation);
        fieldsManager.requiredFieldsHandler = {
            return self.companyFields
        }
        self.fieldsManager.fieldsHandler = {
            return self.allFields;
        }

    }
    func save()->(()->Void){
        return {
            let all = self.fieldsManager.checkAll();
            if all.valid == false{
                all.showAlert(self.topMostController()!, handler: nil);
            }
        }
    }
    func topMostController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController else {
            return nil
        }
        var topController = rootViewController
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        return topController
    }
}
