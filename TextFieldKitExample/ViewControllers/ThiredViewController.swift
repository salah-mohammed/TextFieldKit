//
//  ThiredViewController.swift
//  TextFieldKitExample
//
//  Created by Salah on 11/25/21.
//

import UIKit
import TextFieldKit
class ThiredViewController: UIViewController {
    @IBOutlet weak var txtAddress:TextViewView!
    @IBOutlet weak var txtEducation:TextViewView!

    override func viewDidLoad() {
        super.viewDidLoad()

            
//        self.txtAddress.style = AppDelegate.style;
        txtAddress.placeholder = "Address";
        
//        self.txtEducation.style = AppDelegate.style;
        txtEducation.placeholder = "Education";
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        

    }
    @IBAction func tapGesture(_ sender:Any){
        self.view.endEditing(true);
    }

}
