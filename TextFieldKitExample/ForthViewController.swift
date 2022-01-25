//
//  ForthViewController.swift
//  TextFieldKitExample
//
//  Created by Salah on 11/25/21.
//

import UIKit
import TextFieldKit

class ForthViewController: UIViewController {
    @IBOutlet weak var txtTitle:TitleField!
    @IBOutlet weak var txtFullName:FullNameField!
    @IBOutlet weak var txtRequirements:RequirementsField!
    @IBOutlet weak var txtNewPassword:NewPasswordField!
    @IBOutlet weak var txtConfirmPassword:ConfirmPasswordField!
    @IBOutlet weak var txtPasswordField:PasswordField!
    @IBOutlet weak var txtEmail:EmailField!

    var fields:[FieldValiadtion]{
    return [txtTitle,
            txtFullName,
            txtRequirements,
            txtNewPassword,
            txtConfirmPassword,
            txtPasswordField,
          txtEmail]
    }
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        

    }
    @IBAction func tapGesture(_ sender:Any){
        self.view.endEditing(true);
    }
    @IBAction func btnValid(_ sender:Any?){
       var a =  self.fields.compactMap({$0.valid})
        print(a);
        print(a);
        //.showAlert(self, handler: nil);
    }
}


