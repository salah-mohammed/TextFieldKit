//
//  SecondContentView.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/4/22.
//

import SwiftUI
import TextFieldKit

struct SecondContentView: View {
    func email()->Binding<String> {
     return .init(
        get: {
        viewModel.emailValidation.text ?? ""
        },
        set: {
            viewModel.emailValidation.text = $0
        }
    )
    }
    func fullName()->Binding<String> {
     return .init(
        get: {
            viewModel.fullNameValidation.text ?? ""
        },
        set: {
            viewModel.fullNameValidation.text = $0
        }
    )
    }
    func firstName()->Binding<String> {
     return .init(
        get: {
            viewModel.firstNameValidation.text ?? ""
        },
        set: {
            self.viewModel.firstNameValidation.text = $0 
        }
    )
    }
    func username()->Binding<String> {
     return .init(
        get: {
            viewModel.userNameValidation.text ?? ""
        },
        set: {
            viewModel.userNameValidation.text = $0
        }
    )
    }
    func requirements()->Binding<String> {
     return .init(
        get: {
            viewModel.requirementsValidation.text ?? ""
        },
        set: {
            viewModel.requirementsValidation.text = $0}
    )
    }
    @StateObject var viewModel = SecondContentViewModel.init()

    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing:0) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                    SUITextFieldView(placeholder: nil,
                                     text:email(),
                                     error:$viewModel.emailValidation.error,
                                     iconName:"ic_userOnlineTutor",
                                     onEditingChanged:nil,
                                     validation:(self.viewModel.emailValidation,nil))
                    SUITextFieldView(placeholder: nil,
                                     text:username(),
                                     error:$viewModel.userNameValidation.error,
                                     iconName:"ic_userOnlineTutor",
                                     onEditingChanged:nil,
                                     validation:(self.viewModel.userNameValidation,nil))
                    SUITextFieldView(placeholder: nil,
                                     text:fullName(),
                                     error:$viewModel.fullNameValidation.error,
                                     onEditingChanged:nil,
                                     validation:(self.viewModel.fullNameValidation,nil))
                    SUITextFieldView(placeholder:nil,
                                     text:firstName(),
                                     error:$viewModel.firstNameValidation.error,
                                     onEditingChanged:nil,
                                     validation:(self.viewModel.firstNameValidation,nil))
                    SUITextViewView.init(placeholder: nil,
                                         text:requirements(),
                                         error:$viewModel.requirementsValidation.error,
                                         iconName:"ic_userOnlineTutor",
                                         onEditingChanged:nil,
                                         validation:(self.viewModel.requirementsValidation,nil))
                    Button.init(action: self.viewModel.save(), label:{Text("Save")})
                }
                .padding()
            }.frame(maxWidth:.infinity,maxHeight:.infinity).background(Color.gray.opacity(0.5)).gesture(TapGesture()
                .onEnded { _ in
                    UIApplication.shared.endEditing();
                })
        }
    }
}

struct SecondContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondContentView()
    }
}
