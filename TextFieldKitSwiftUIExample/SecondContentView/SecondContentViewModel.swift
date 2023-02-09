//
//  SecondContentViewModel.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/8/22.
//

import UIKit
import SwiftUI
import TextFieldKit
class SecondContentViewModel:NSObject,ObservableObject{
    @Published  var fullName:String="Ahmed"
    @Published  var firstName:String="Ahmed"
    @Published  var userName:String="Ahmed"
    @Published  var requirements:String=""

    @Published  var fullNameError:String=""
    @Published  var firstNameError:String=""
    @Published  var userNameError:String=""
    @Published  var requirementsError:String=""
    
    override init() {
        super.init();
        
    }
    func save()->(()->Void){
        return {
            
        }
    }
    func onEditingChangedFullName()->OnEditingValiadtionChanged{
        return { value,validation  in
            self.fullNameError = validation?.messages.string ?? "";
        }
    }
    func onEditingChangedFirstName()->OnEditingValiadtionChanged{
        return { value,validation in
            self.firstNameError = validation?.messages.string ?? "";
        }
    }
    func onEditingChangedUsername()->OnEditingValiadtionChanged{
        return { value,validation in
            self.userNameError = validation?.messages.string ?? "";
        }
    }
    func onEditingChangedRequirements()->OnEditingValiadtionChanged{
        return { value,validation in
            self.requirementsError = validation?.messages.string ?? "";
        }
    }
}
