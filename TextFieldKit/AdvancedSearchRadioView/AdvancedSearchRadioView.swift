//
//  AdvancedSearchRadioView.swift
//  CheckBoxSelectionKitExample
//
//  Created by Salah on 9/22/20.
//  Copyright © 2020 Salah. All rights reserved.
//


import UIKit

class FieldStyle{
    public var titleFont:UIFont?{
        didSet{
            
        }
    }
    public var font:UIFont?{
        didSet{
            
        }
    }
    public var selectedIndicatorColor:UIColor?{
        didSet{
            
        }
    }
    public var indicatorColor:UIColor?{
        didSet{
            
        }
    }
    public var selectedTitleColor:UIColor?{
        didSet{
            
        }
    }
    public var titleColor:UIColor?{
        didSet{
            
        }
    }
    public var indicatorHeight:CGFloat?{
        didSet{
            
        }
    }
    public var textColor:UIColor?{
        didSet{
            
        }
    }
    public var selectedTextColor:UIColor?{
        didSet{
            
        }
    }
    
}
@IBDesignable
open class AdvancedSearchRadioView: UIView {
     // private
     private var contentView : UIView?
     @IBOutlet weak private var layoutConstraintHeightOfIndicator: NSLayoutConstraint!
     @IBOutlet weak private var lblTitle: UILabel!
     @IBOutlet weak private var txtField: UITextField!
     @IBOutlet weak private var viewIndicator: UIView!
     //
    var style = FieldStyle.init();
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup(){
        contentView = loadViewFromNib()
        
        contentView!.frame = bounds
        // Adding custom subview on top of our view
        addSubview(contentView!)
        
        self.contentView!.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": contentView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": contentView]))
        
        
        
        self.setupView();
    }
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    func setupView(){

    
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.txtField.addTarget(self, action: #selector(Self.textFieldDidBegin(_:)), for: .editingDidBegin)
        self.txtField.addTarget(self, action: #selector(Self.textFieldDidBegin(_:)), for: .editingDidEnd)

    }
    @objc func textFieldDidBegin(_ txt:UITextField){
        self.editingStyle();
    }
    @objc func textFieldDidEnd(_ txt:UITextField){
        self.normalStyle();
    }
    @IBAction func btnAction(_ sender:UIButton){
    }
    func setup(){
        
    }
    func editingStyle(){
        self.viewIndicator.backgroundColor = self.style.selectedIndicatorColor;
        self.lblTitle.textColor = self.style.selectedTitleColor;
        self.txtField.textColor = self.style.selectedTextColor
    }
    func normalStyle(){
        self.viewIndicator.backgroundColor = self.style.indicatorColor;
        self.lblTitle.textColor = self.style.titleColor;
        self.txtField.textColor = self.style.textColor
    }
}
