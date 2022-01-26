//
//  SecondViewController.swift
//  TextFieldKitExample
//
//  Created by Salah on 11/25/21.
//

import UIKit
import TextFieldKit

class SecondViewController: UIViewController {
    @IBOutlet weak var txtAddress: TextViewView!
    @IBOutlet weak var txtEducation: TextViewView!
    @IBOutlet weak var txtFirstName:TextFieldView!
    @IBOutlet weak var txtLastName:TextFieldView!
    @IBOutlet weak var txtCity:DropDownTextField!
    @IBOutlet weak var txtPhoneNumber:PhoneNumberField!
    @IBOutlet weak var txtAdvancedPhoneNumber:AdvancedPhoneNumber!

    override func viewDidLoad() {
        super.viewDidLoad()

        
//        self.txtFirstName.style = AppDelegate.style;
        txtFirstName.icon = UIImage.init(named:"ic_setting_phone")
        txtFirstName.placeholder = "FirstName";
        
//        self.txtLastName.style = AppDelegate.style;
        txtLastName.placeholder = "LastName";
        
//        self.txtAddress.style = AppDelegate.style;
        txtAddress.placeholder = "Address";
        
//        self.txtEducation.style = AppDelegate.style;
        txtEducation.placeholder = "Education";
        
//        self.txtCity.style = AppDelegate.dropDownStyle;
        txtCity.placeholder = "City";
        txtCity.icon = UIImage.init(named:"ic_setting_phone")
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
        

    }
    @IBAction func tapGesture(_ sender:Any){
        self.view.endEditing(true);
    }

}


