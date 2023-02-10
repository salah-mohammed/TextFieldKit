//
//  AppDelegate.swift
//  FloatingTextFieldExample
//
//  Created by Salah on 10/28/21.
//

import UIKit
import TextFieldKit

// 
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        TextFieldView.appearance(whenContainedInInstancesOf: [SecondViewController.self]).style=AppStyle.textViewStyle2
        TextViewView.appearance(whenContainedInInstancesOf: [SecondViewController.self]).style=AppStyle.textViewStyle2
        DropDownTextField.appearance(whenContainedInInstancesOf: [SecondViewController.self]).style=AppStyle.dropDownStyl2

        TextFieldView.appearance().style = AppStyle.textViewStyle;
        TextViewView.appearance().style = AppStyle.textViewStyle;
        DropDownTextField.appearance().style = AppStyle.dropDownStyle;
        
//        TextFieldView.fieldDidEnd = { field in
//        let messages = (field as? FieldValiadtion)?.messages
//        (field as GeneralFieldViewProrocol).error = messages?.valid == false ? messages?.string ?? "":nil
//        }
//        TextViewView.fieldDidEnd = { field in
//        let messages = (field as? FieldValiadtion)?.messages
//        (field as GeneralFieldViewProrocol).error = messages?.valid == false ? messages?.string ?? "":nil
//        }
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

