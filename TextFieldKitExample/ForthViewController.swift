//
//  ForthViewController.swift
//  TextFieldKitExample
//
//  Created by Salah on 11/25/21.
//

import UIKit
import TextFieldKit
class ForthViewController: UIViewController {
    @IBOutlet weak var txtAdvancedPhoneNumber:AdvancedPhoneNumber!
    @IBOutlet weak var txtLocationTextField:LocationTextField!
    @IBOutlet weak var txtTitle:TitleField!
    @IBOutlet weak var txtFullName:FullNameField!
    @IBOutlet weak var txtRequirements:RequirementsField!
    @IBOutlet weak var txtNewPassword:NewPasswordField!
    @IBOutlet weak var txtConfirmPassword:ConfirmPasswordField!
    @IBOutlet weak var txtPasswordField:PasswordField!
    @IBOutlet weak var txtEmail:EmailField!
    @IBOutlet weak var txtCity:CustomCityField!
    var fields:[FieldValiadtion]{
    return [
        txtAdvancedPhoneNumber,
        txtLocationTextField,
        txtFullName,
        txtPasswordField,
        txtNewPassword,
        txtConfirmPassword,
        txtEmail,
        txtTitle,
        txtCity,
        txtRequirements]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFullName.fieldDidEnd = { _ in
            self.txtFullName.error = "AA"
        }
        txtCity.placeholder = "City";
        txtCity.icon = UIImage.init(named:"ic_setting_phone")
        txtCity.dropDownIcon = UIImage.init(named:"ic_drop_down")

        txtCity.dropDownHandler = { textfield in
        self.txtCity.object = "Cairo";
        }
//        txtRegion.placeholder="Region";
//        txtRegion.dropDownHandler = { textfield in
//        self.txtRegion.text = "ahrammat";
//        }

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        

    }
    @IBAction func tapGesture(_ sender:Any){
        self.view.endEditing(true);
    }
    @IBAction func btnValid(_ sender:Any?){
        if self.fields.flatMap({$0.messages}).valid == false{
            self.fields.flatMap({$0.messages}).showAlert(self, handler: nil);
        }
    }
}


