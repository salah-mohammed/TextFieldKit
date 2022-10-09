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
    @StateObject var viewModel = ContentViewModel.init()

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
                                 onEditingChanged:self.viewModel.onEditingChangedUsername(),
                                 validation:Username())
                SUITextFieldView(placeholder: nil,
                                 text:fullName(),
                                 error:$viewModel.fullNameError,
                                 onEditingChanged:self.viewModel.onEditingChangedFullName(),
                                 validation:FullName())
                SUITextFieldView(placeholder:nil,
                                 text:firstName(),
                                 error:$viewModel.firstNameError,
                                 onEditingChanged:self.viewModel.onEditingChangedFirstName(),
                                 validation:FirstName());
                SUITextViewView.init(placeholder: nil,
                                     text:requirements(),
                                     error:$viewModel.requirementsError,
                                     iconName:"ic_userOnlineTutor",
                                     onEditingChanged:self.viewModel.onEditingChangedRequirements(),
                                     validation:Requirements())
                Button.init(action: self.viewModel.save(), label:{Text("Save")})
            }
            .padding()
        }.frame(maxWidth:.infinity,maxHeight:.infinity).background(Color.gray.opacity(0.5)).gesture(TapGesture()
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
