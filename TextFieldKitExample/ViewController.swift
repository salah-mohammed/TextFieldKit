//
//  ViewController.swift
//  FloatingTextFieldExample
//
//  Created by Salah on 10/28/21.
//

import UIKit
import TextFieldKit
class ViewController: UIViewController {
    @IBOutlet weak var txtAddress: TextViewView!
    @IBOutlet weak var txtEducation: TextViewView!
    @IBOutlet weak var txtFirstName:TextFieldView!
    @IBOutlet weak var txtLastName:TextFieldView!
    @IBOutlet weak var txtCity:DropDownTextField!
    @IBOutlet weak var txtPhoneNumber:PhoneNumberField!

    override func viewDidLoad() {
        super.viewDidLoad()
        TextFieldView.appearance().style = UIColor.textViewStyle;
        TextViewView.appearance().style = UIColor.textViewStyle;
        DropDownTextField.appearance().style = UIColor.textFieldStyle;
        
        var a =  DropDownTextField.appearance().style;
//        self.txtFirstName.style = AppDelegate.style;
        txtFirstName.icon = UIImage.init(named:"01185")
        txtFirstName.placeholder = "FirstName";
        
//        self.txtLastName.style = AppDelegate.style;
        txtLastName.placeholder = "LastName";
        
//        self.txtAddress.style = AppDelegate.style;
        txtAddress.placeholder = "Address";
        
//        self.txtEducation.style = AppDelegate.style;
        txtEducation.placeholder = "Education";
        
//        self.txtCity.style = AppDelegate.dropDownStyle;
        txtCity.placeholder = "City";
        txtCity.icon = UIImage.init(named:"01185")
        txtCity.dropDownIcon = UIImage.init(named:"ic_drop_down")

        txtCity.dropDownHandler = { textfield in
            self.txtCity.text = "sadsadsad sadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsad";
        }
        txtPhoneNumber.flag = UIImage.init(named:"AE");
        txtPhoneNumber.countryCode = "+972";
        txtPhoneNumber.countryPickerHandler = { textfield in
            self.txtPhoneNumber.text = "asd";
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
//        self.txt
    }
    @IBAction func tapGesture(_ sender:Any){
        self.view.endEditing(true);
    }

}



extension UIColor {
    public static var placeholder: UIColor {
          return UIColor.init(red: 0, green: 0, blue: 0.0980392, alpha: 0.22);
  }
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
    
    static var textViewStyle:TextViewStyle = {
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
    static var textFieldStyle:FieldStyle = {
        var fieldStyle = FieldStyle.init();
//        fieldStyle.spaceBetweenFieldAndIndicator = 16;
        fieldStyle.indicatorHeight = 3.0
        fieldStyle.selected = FieldColorStyle.init(.red,.red,.red)
        fieldStyle.normal = FieldColorStyle.init(UIColor.placeholderText,UIColor.placeholderText,UIColor.placeholderText)
        fieldStyle.filled = FieldColorStyle.init(.green,.green,.green)
        fieldStyle.titleFont = UIFont.systemFont(ofSize: 16);
        fieldStyle.textFont = UIFont.systemFont(ofSize: 14);
        fieldStyle.spaceBetweenIconAndField = 8
        return fieldStyle;
    }()
}
