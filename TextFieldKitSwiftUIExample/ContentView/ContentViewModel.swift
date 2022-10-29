//
//  ContentViewModel.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/8/22.
//

import UIKit
import SwiftUI
typealias OnEditingChanged = (Bool) -> Void
class ContentViewModel:NSObject,ObservableObject{
    @Published  var fullName:String="Ahmed"
    @Published  var firstName:String="Ahmed"
    @Published  var userName:String="Ahmed"
    @Published  var requirements:String=""
    @Published  var city:String=""
    @Published  var phoneNumber:String=""
    @Published  var countryCode:String="+966"

    @Published  var fullNameError:String=""
    @Published  var firstNameError:String=""
    @Published  var userNameError:String=""
    @Published  var requirementsError:String=""
    @Published  var cityError:String=""
    @Published  var phoneNumberError:String=""

    override init() {
        super.init();
        
    }
    func save()->(()->Void){
        return {
            UIApplication.shared.endEditing();
        }
    }
    func cityPicker()->()->Void{
        return {
            self.city = "New yourk"
        }
    }
    func countryPicker()->()->Void{
        return {
            self.countryCode = "+972"
        }
    }
    func onEditingChangedFullName()->OnEditingChanged{
        return { value in
            self.fullNameError = "error onEditingChangedFullName";
        }
    }
    func onEditingChangedFirstName()->OnEditingChanged{
        return { value in
            self.firstNameError = "error FirstName";
        }
    }
    func onEditingChangedUsername()->OnEditingChanged{
        return { value in
            self.userNameError = "error Username";
        }
    }
    func onEditingChangedRequirements()->OnEditingChanged{
        return { value in
            self.requirementsError = "error Requirements";
        }
    }
    func onEditingChangedCity()->OnEditingChanged{
        return { value in
            self.requirementsError = "error Requirements";
        }
    }
}
