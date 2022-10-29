//
//  ContentView.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/4/22.
//

import SwiftUI
import TextFieldKit
public extension UIApplication {
     func endEditing() {
        let keyWindow = connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        keyWindow?.endEditing(true)
    }
}

struct ContentView: View {
    func fullName()->Binding<String> {
     return .init(
        get: {viewModel.fullName },
        set: {viewModel.fullName = $0 }
    )
    }
    func firstName()->Binding<String> {
     return .init(
        get: {viewModel.firstName },
        set: {viewModel.firstName = $0 }
    )
    }
    func username()->Binding<String> {
     return .init(
        get: {viewModel.userName },
        set: {viewModel.userName = $0 }
    )
    }
    func requirements()->Binding<String> {
     return .init(
        get: {viewModel.requirements },
        set: {viewModel.requirements = $0 }
    )
    }
    func city()->Binding<String> {
     return .init(
        get: {viewModel.city },
        set: {viewModel.city = $0 }
    )
    }
    @StateObject var viewModel = ContentViewModel.init()

    var body: some View {
        ZStack{
            VStack(spacing:0) {
                Image("ic_drop_down")
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                SUITextFieldView(placeholder:"Username",
                                 text:username(),
                                 error:$viewModel.userNameError,
                                 iconName:"ic_userOnlineTutor",
                                 onEditingChanged:self.viewModel.onEditingChangedUsername(),
                                 validation:nil)
                SUITextFieldView(placeholder:"FullName",
                                 text:fullName(),
                                 error:$viewModel.fullNameError,
                                 onEditingChanged:self.viewModel.onEditingChangedFullName(),
                                 validation:nil)
                SUITextFieldView(placeholder:"FirstName",
                                 text:firstName(),
                                 error:$viewModel.firstNameError,
                                 onEditingChanged:self.viewModel.onEditingChangedFirstName(),
                                 validation:nil);
                SUITextFieldView(placeholder:"City",
                                 text:city(),
                                 error:$viewModel.cityError,
                                 dropDownData:("ic_drop_down",nil,nil,self.viewModel.cityPicker()),
                                 onEditingChanged:self.viewModel.onEditingChangedCity(),
                                 validation:nil);
                SUITextViewView.init(placeholder:"Requirements",
                                     text:requirements(),
                                     error:$viewModel.requirementsError,
                                     iconName:"ic_userOnlineTutor",
                                     onEditingChanged:self.viewModel.onEditingChangedRequirements(),
                                     validation:nil)
                Button.init(action: self.viewModel.save(), label:{
                    Text("Save")}
                )
            }
            .padding()
        }.frame(maxWidth:.infinity,maxHeight:.infinity).gesture(TapGesture()
            .onEnded { _ in
                UIApplication.shared.endEditing();
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
