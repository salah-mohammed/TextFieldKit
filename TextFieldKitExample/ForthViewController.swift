//
//  ForthViewController.swift
//  TextFieldKitExample
//
//  Created by Salah on 11/25/21.
//

import UIKit
import TextFieldKit
enum UserType:Int{
case user=0
case company=1
}
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
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    var userType:UserType?{
        didSet{
            if let userType:UserType=userType{
            self.segmentedControl.selectedSegmentIndex=userType.rawValue
            }
        }
    }
    var userFields:[FieldValiadtion]{
    return [
        txtFullName,
        txtPasswordField,
        txtNewPassword,
        txtConfirmPassword]
    }
    var companyFields:[FieldValiadtion]{
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
    var fields:[FieldValiadtion]{
        return  self.userType == .user ? self.userFields:self.companyFields
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userType = .user;
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
    @IBAction func btnUserType(_ sender:UISegmentedControl){
        self.userType = UserType.init(rawValue:sender.selectedSegmentIndex)
    }
    @IBAction func btnValid(_ sender:Any?){
        if self.fields.flatMap({$0.messages}).valid == false{
            self.fields.flatMap({$0.messages}).showAlert(self, handler: nil);
        }
    }
}


