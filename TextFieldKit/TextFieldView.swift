//
//  TextFieldView.swift
//  CheckBoxSelectionKitExample
//
//  Created by Salah on 9/22/20.
//  Copyright © 2020 Salah. All rights reserved.
//


import UIKit
#if canImport(PhoneKit)
import PhoneKit
#endif



public typealias FieldHandler = (GeneralFieldViewProrocol)->Void
open class TextFieldView: UIView,GeneralFieldViewProrocol,CutomFieldProrocol {
    // MARK:Customisable
    open var nibName:String{
        return "TextFieldView";
    }
     // private
     private var contentView : UIView?
     @IBOutlet weak  var lblTitle: UILabel!
     @IBOutlet weak private var lblError: UILabel!
     @IBOutlet weak open var txtField: UITextField!
     @IBOutlet weak private var stackViewIcon: UIStackView?
     @IBOutlet weak private var  stackViewTitleAndText: UIStackView?
     @IBOutlet weak private var imgIcon: UIImageView?
     // MARK:Optional
     @IBOutlet weak private var layoutConstraintHeightOfIndicator: NSLayoutConstraint?
     @IBOutlet weak private var viewIndicator: UIView?

     @objc open dynamic var style = FieldStyle.init(){
        didSet{
            self.lblTitle.font = self.style.titleFont ?? self.lblTitle.font;
            self.txtField.font = self.style.textFont ?? self.txtField.font
            self.lblError.textColor = self.style.errorColor;
            self.lblError.font = style.errorFont;
            if self.isFirstResponder{
                self.selectedStyle();
            }else
            if self.txtField.text?.count ?? 0 == 0{
                self.normalStyle();
            }else{
                self.filledStyle();
            }
            self.spaceBetweenIconAndField = self.style.spaceBetweenIconAndField
            self.indicatorHeight = self.style.indicatorHeight;
        }
    }
    open var text:String?{
        set{
            self.txtField.text = newValue;
            self.endEditingField(text);
        }
        get{
            return self.txtField.text;
        }
     }
   open var placeholder:String?{
        didSet{
            self.lblTitle.text = placeholder
            self.txtField.placeholder = placeholder;
        }
    }
    open var error: String?{
        didSet{
            self.lblError?.isHidden = ((self.error?.count ?? 0) > 0) ? false:true
            self.lblError?.text = error;
            self.cutomLayoutSubviews();
        }
    }

    open var icon:UIImage?{
         didSet{
            self.imgIcon?.image=icon;
            self.imgIcon?.superview?.isHidden = (self.imgIcon?.image == nil)

         }
     }
    public var spaceBetweenIconAndField:CGFloat=8{
        didSet{
            self.stackViewIcon?.directionalLayoutMargins = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing:spaceBetweenIconAndField)
        }
    }
    public var indicatorHeight:CGFloat=1{
        didSet{
            self.layoutConstraintHeightOfIndicator?.constant = indicatorHeight
        }
    }
    open var fieldDidEnd:FieldHandler?=TextFieldView.fieldDidEnd
    open var fieldValueChanged:FieldHandler?=TextFieldView.fieldValueChanged
    open var fieldDidBegin:FieldHandler?=TextFieldView.fieldDidBegin
    
    public static var fieldDidEnd:FieldHandler?
    public static var fieldValueChanged:FieldHandler?
    public static var fieldDidBegin:FieldHandler?
    
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
        
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle.module)
        var module:Bundle?
        if String.fieldsType.contains(nibName){
            module = Bundle.module;
        }
        let nib = UINib(nibName:nibName, bundle:module)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    func setupView(){
    }
    open override func layoutSubviews() {
        super.layoutSubviews();
        cutomLayoutSubviews();
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.txtField.addTarget(self, action: #selector(Self.textFieldDidBegin(_:)), for: .editingDidBegin)
        self.txtField.addTarget(self, action: #selector(Self.textFieldDidEnd(_:)), for: .editingDidEnd)
        self.txtField.addTarget(self, action: #selector(Self.textFieldValueChanged(_:)), for: .valueChanged)
        
        normalStyle()
        let tempIcon = self.icon;
        self.icon = tempIcon;
        let tempError = self.error;
        self.error = tempError;
    }
    @objc private func textFieldValueChanged(_ txt:UITextField){
        self.fieldValueChanged?(self);
    }
    @objc private func textFieldDidBegin(_ txt:UITextField){
        self.selectedStyle();
        self.fieldDidBegin?(self)
    }
    @objc private func textFieldDidEnd(_ txt:UITextField){
        self.endEditingField(txt.text);
        self.fieldDidEnd?(self);
    }
    @IBAction func btnAction(_ sender:UIButton){
    }
    func setup(){
        
    }
    private func endEditingField(_ text:String?){
        if (text?.count ?? 0) == 0{
        self.normalStyle();
        }else{
        filledStyle();
        }
    }
    // MARK:Customisable
    open func cutomLayoutSubviews(){
        let  value = (self.lblError?.frame.height ?? 0)
        let  secondValue = (self.error?.count ?? 0) > 0 ? (value/2):0
        self.stackViewTitleAndText?.spacing = secondValue
        self.stackViewTitleAndText?.directionalLayoutMargins = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: secondValue, trailing: 0)
    }
    // MARK:Customisable
    open func selectedStyle(){
        self.indicatorColor(self.style.selected?.indicatorColor)
        self.lblTitle.textColor = self.style.selected?.titleColor;
        self.txtField.textColor = self.style.selected?.textColor
        self.showLabelTitle();
    }
    // MARK:Customisable
    open func normalStyle(){
        self.indicatorColor(self.style.normal?.indicatorColor)
        self.lblTitle.textColor = self.style.normal?.titleColor;
        self.txtField.textColor = self.style.normal?.textColor
        if self.style.autoHideTitle{
        self.hideLabelTitle();
        }
    }
    // MARK:Customisable
    open func filledStyle(){
        self.indicatorColor(self.style.filled?.indicatorColor)
        self.lblTitle.textColor = self.style.filled?.titleColor;
        self.txtField.textColor = self.style.filled?.textColor
        self.showLabelTitle();
    }
    func indicatorColor(_ color:UIColor?){
        UIView.animate(withDuration:0.2, animations: {
        self.viewIndicator?.backgroundColor=color
        })
    }
    private  func showLabelTitle(){
//        UIView.transition(with: lblTitle, duration: 0.3,
//                          options: .allowAnimatedContent,
//                          animations: {
            self.lblTitle.isHidden=false;
//                      })
    }
    private func hideLabelTitle(){
//        UIView.transition(with: lblTitle, duration: 0.3,
//                          options: .allowAnimatedContent,
//                          animations: {
            self.lblTitle.isHidden=true;
//                      })
    }
}
