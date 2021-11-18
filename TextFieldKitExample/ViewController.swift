//
//  ViewController.swift
//  FloatingTextFieldExample
//
//  Created by Salah on 10/28/21.
//

import UIKit
import TextFieldKit
class ViewController: UIViewController {
    @IBOutlet weak var txt: AdvancedSearchRadioView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txt.style = AppDelegate.style;
        txt.placeholder = "Name";
        // Do any additional setup after loading the view.
    }
    @IBAction func tapGesture(_ sender:Any){
        self.view.endEditing(true);
    }

}

