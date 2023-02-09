//
//  TextFieldKitSwiftUIExampleApp.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/4/22.
//

import SwiftUI
import TextFieldKit
@main
struct TextFieldKitSwiftUIExampleApp: App {
    @Environment(\.scenePhase) private var lifecycle
    var body: some Scene {
        WindowGroup {
//            ContentView()
            SecondContentView()
        }.onChange(of: lifecycle) { (lifecycle) in
            SUITextFieldView.style = AppStyle.textFieldStyle
            SUITextViewView.style = AppStyle.textFieldStyle

            switch lifecycle {
            case .active:
                break;
            case .inactive:
                print("inactive")
            case .background:
                print("background")
            @unknown default:
                print("a");
            }
        }
    }
}
