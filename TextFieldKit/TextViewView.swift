//
//  TextViewView.swift
//  CheckBoxSelectionKitExample
//
//  Created by Salah on 9/22/20.
//  Copyright © 2020 Salah. All rights reserved.
//


import UIKit

@IBDesignable
open class TextViewView: UIView {
     // private
     private var contentView : UIView?
     @IBOutlet weak private var layoutConstraintHeightOfIndicator: NSLayoutConstraint!
     @IBOutlet weak private var layoutConstraintHeightOfSpaceView: NSLayoutConstraint?

     @IBOutlet weak private var lblTitle: UILabel!
     @IBOutlet weak private var txtField: UITextView!
     @IBOutlet weak private var viewIndicator: UIView!
     @IBOutlet weak private var imgIconDown: UIImageView!

     //
    open var style = FieldStyle.init(){
        didSet{
            self.lblTitle.font = self.style.titleFont ?? self.lblTitle.font;
            self.txtField.font = self.style.textFont ?? self.txtField.font
            if self.isFirstResponder{
                self.selectedStyle();
            }else
            if self.txtField.text?.count ?? 0 == 0{
                self.normalStyle();
            }else{
                self.filledStyle();
            }
        }
    }
    open var placeholder:String?{
        didSet{
            self.lblTitle.text = placeholder
//            self.txtField.placeholder = placeholder;
        }
    }
    open var space:CGFloat=0{
        didSet{
            self.layoutConstraintHeightOfSpaceView?.constant = space;
        }
    }
    open var icon:UIImage?{
         didSet{
            self.imgIconDown.image=icon;
            self.imgIconDown.superview?.isHidden = (self.imgIconDown.image == nil)
         }
     }
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
        
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle.module)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    func setupView(){
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib();
//        self.txtField.addTarget(self, action: #selector(Self.textFieldDidBegin(_:)), for: .editingDidBegin)
//        self.txtField.addTarget(self, action: #selector(Self.textFieldDidEnd(_:)), for: .editingDidEnd)
        self.layoutConstraintHeightOfIndicator.constant = self.style.indicatorHeight;
        normalStyle()
        self.txtField.delegate=self;
        self.lblTitle.font = self.style.titleFont ?? self.lblTitle.font;
        self.txtField.font = self.style.textFont ?? self.txtField.font
        self.layoutConstraintHeightOfSpaceView?.constant = space;
        let tempIcon = self.icon;
        self.icon = tempIcon;

    }
//    @objc func textFieldDidBegin(_ txt:UITextField){
//        self.selectedStyle();
//    }
//    @objc func textFieldDidEnd(_ txt:UITextField){
//        if (self.txtField.text?.count ?? 0) == 0{
//        self.normalStyle();
//        }else{
//        filledStyle();
//        }
//    }
    @IBAction func btnAction(_ sender:UIButton){
    }
    func setup(){
        
    }
    func selectedStyle(){
        self.indicatorColor(self.style.selected?.indicatorColor)
        self.lblTitle.textColor = self.style.selected?.titleColor;
        self.txtField.textColor = self.style.selected?.textColor
        self.showLabelTitle();
    }
    func normalStyle(){
        self.indicatorColor(self.style.normal?.indicatorColor)
        self.lblTitle.textColor = self.style.normal?.titleColor;
        self.txtField.textColor = self.style.normal?.textColor
        if self.style.autoHideTitle{
        self.hideLabelTitle();
        }
    }
    func filledStyle(){
        self.indicatorColor(self.style.filled?.indicatorColor)
        self.lblTitle.textColor = self.style.filled?.titleColor;
        self.txtField.textColor = self.style.filled?.textColor
        self.showLabelTitle();
    }
    func indicatorColor(_ color:UIColor?){
        UIView.animate(withDuration:0.2, animations: {
        self.viewIndicator.backgroundColor=color
        })
    }
    func showLabelTitle(){
        UIView.animate(withDuration:0.3, animations: {
        self.lblTitle.isHidden=false;
        })
    }
    func hideLabelTitle(){
        UIView.animate(withDuration:0.3, animations: {
        self.lblTitle.isHidden=true;
        })
    }
}
extension TextViewView:UITextViewDelegate{
    public func textViewDidBeginEditing(_ textView: UITextView) {
        self.selectedStyle();
    }
    public func textViewDidEndEditing(_ textView: UITextView) {
        if (self.txtField.text?.count ?? 0) == 0{
        self.normalStyle();
        }else{
        filledStyle();
        }
    }
}
