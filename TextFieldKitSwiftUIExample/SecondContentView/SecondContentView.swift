//
//  SecondContentView.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/4/22.
//

import SwiftUI
import TextFieldKit

struct SecondContentView: View {
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
        set: {viewModel.requirements = $0
            userNameV.text = $0}
    )
    }
    @StateObject var viewModel = SecondContentViewModel.init()
   var  userNameV = Username()
    var body: some View {
        ZStack{
            VStack(spacing:0) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                SUITextFieldView(placeholder: nil,
                                 text:username(),
                                 error:$viewModel.userNameError,
                                 iconName:"ic_userOnlineTutor",
                                 onEditingChanged:nil,
                                 validation:(userNameV,self.viewModel.onEditingChangedUsername()))
                SUITextFieldView(placeholder: nil,
                                 text:fullName(),
                                 error:$viewModel.fullNameError,
                                 onEditingChanged:nil,
                                 validation:(FullName(),self.viewModel.onEditingChangedFullName()))
                SUITextFieldView(placeholder:nil,
                                 text:firstName(),
                                 error:$viewModel.firstNameError,
                                 onEditingChanged:nil,
                                 validation:(FirstName(),self.viewModel.onEditingChangedFirstName()))
                SUITextViewView.init(placeholder: nil,
                                     text:requirements(),
                                     error:$viewModel.requirementsError,
                                     iconName:"ic_userOnlineTutor",
                                     onEditingChanged:nil,
                                     validation:(Requirements(),self.viewModel.onEditingChangedRequirements()))
//                Button.init(action: self.viewModel.save(), label:{Text("Save")})
            }
            .padding()
        }.frame(maxWidth:.infinity,maxHeight:.infinity).background(Color.gray.opacity(0.5)).gesture(TapGesture()
            .onEnded { _ in
                UIApplication.shared.endEditing();
            })
    }
}

struct SecondContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondContentView()
    }
}
