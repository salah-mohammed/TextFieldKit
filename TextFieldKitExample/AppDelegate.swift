//
//  AppDelegate.swift
//  FloatingTextFieldExample
//
//  Created by Salah on 10/28/21.
//

import UIKit
import TextFieldKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//    static var style:FieldStyle = {
//        var fieldStyle = FieldStyle.init();
//        fieldStyle.indicatorHeight = 1.0;
//
//        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
//        fieldStyle.normal = FieldColorStyle.init(.brown,.brown,.brown)
//        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
//
//        return fieldStyle;
//    }()
    static var style:FieldStyle = {
        var fieldStyle = TextViewStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
//        fieldStyle.spaceBetweenTitleAndField = 8;

        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
        fieldStyle.normal = FieldColorStyle.init(.brown,.brown,.brown)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)

        return fieldStyle;
    }()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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

