//
//  TextFieldKitSwiftUIExampleApp.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/4/22.
//

import SwiftUI

@main
struct TextFieldKitSwiftUIExampleApp: App {
    @Environment(\.scenePhase) private var lifecycle
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: lifecycle) { (lifecycle) in
            SUITextFieldView.style = AppStyle.textFieldStyle

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
