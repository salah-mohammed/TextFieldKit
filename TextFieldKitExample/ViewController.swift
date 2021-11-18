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
    @IBOutlet weak var txtFirstName:TextFieldView!
    @IBOutlet weak var txtLastName:TextFieldView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtFirstName.style = AppDelegate.style;
        txtFirstName.placeholder = "FirstName";
        
        self.txtLastName.style = AppDelegate.style;
        txtLastName.placeholder = "LastName";
        
        self.txtAddress.style = AppDelegate.style;
        txtAddress.placeholder = "Address";
        // Do any additional setup after loading the view.
    }
    @IBAction func tapGesture(_ sender:Any){
        self.view.endEditing(true);
    }

}

