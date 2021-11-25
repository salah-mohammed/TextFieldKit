//
//  AppDelegate.swift
//  FloatingTextFieldExample
//
//  Created by Salah on 10/28/21.
//

import UIKit
import TextFieldKit

extension UIColor {
    public static var placeholder: UIColor {
          return UIColor.init(red: 0, green: 0, blue: 0.0980392, alpha: 0.22);
  }
}


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var dropDownStyle:DropDownStyle = {
        var fieldStyle = DropDownStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 3.0
        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        fieldStyle.dropDownTraling = 16;
        fieldStyle.spaceBetweenTextAndDropDownIcon = 0
        return fieldStyle;
    }()
    
    static var style:TextViewStyle = {
        var fieldStyle = TextViewStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 3.0
        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        fieldStyle.spaceBetweenTitleAndField = .auto;
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

