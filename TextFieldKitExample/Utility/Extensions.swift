//
//  Extensions.swift
//  TextFieldKitExample
//
//  Created by SalahMohamed on 08/02/2023.
//

import UIKit
public enum RegularExpression:String{
    case email="[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case phone = "[+]+[0-9 ]{1,}|[00]+[0-9 ]{1,}|[0-9 ]{9,}"
    case empty=".*[^ ].*"
    var regex:Regex{
        return Regex.init(self.rawValue);
    }
    func  matches(_ input:String)->Bool{
    return self.regex.matches(input:input)
    }
}

extension UIView{
        var parent: UIViewController? {
            // Starts from next (As we know self is not a UIViewController).
            var parentResponder: UIResponder? = self.next
            while parentResponder != nil {
                if let viewController = parentResponder as? UIViewController {
                    return viewController
                }
                parentResponder = parentResponder?.next
            }
            return nil
        }
}
extension String{
    var isEmpty:Bool{
        return (RegularExpression.empty.matches(self)==false)
    }
}
