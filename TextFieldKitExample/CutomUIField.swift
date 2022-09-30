//
//  CutomUIField.swift
//  TextFieldKitExample
//
//  Created by Salah on 9/30/22.
//

import UIKit
import TextFieldKit
open class CutomUIField: TextFieldView {
    @IBOutlet weak private var viewContent: UIView?
    private var contentView : UIView?

    open override func selectedStyle(){
        
    }
    open  override func normalStyle(){
        
    }
    open override func filledStyle(){
        
    }
    open override func cutomLayoutSubviews(){
        
    }
    open override var nibName:String { return "CutomUIField"}
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
