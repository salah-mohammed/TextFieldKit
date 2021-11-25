//
//  TextViewView.swift
//  CheckBoxSelectionKitExample
//
//  Created by Salah on 9/22/20.
//  Copyright © 2020 Salah. All rights reserved.
//


import UIKit

public enum SpaceStyle{
    case auto
    case cutome(CGFloat)
}
@objcMembers
public class TextViewStyle:FieldStyle{
    open var spaceBetweenFieldAndIndicator:CGFloat=0
    open var spaceBetweenTitleAndField:SpaceStyle = .auto
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let copy = TextViewStyle()
        return copy
    }
    
}
@objcMembers
open class TextViewView: UIView {
    func caluclateSpace(_ textfield:TextFieldView)->CGFloat{
        var heightOfTextInsideTextField = "a".height(withConstrainedWidth: 200, font: textfield.txtField.font!)
        var heightOfTitle = "a".height(withConstrainedWidth: 200, font: textfield.lblTitle.font!)
        return (textfield.frame.height - heightOfTextInsideTextField - heightOfTitle)/2
    }
    // private
    private var contentView : UIView?
    @IBOutlet weak private var layoutConstraintHeightOfIndicator: NSLayoutConstraint!
    @IBOutlet weak private var layoutConstraintHeightOfViewBetweenFieldAndIndicator: NSLayoutConstraint?
    @IBOutlet weak private var layoutConstraintHeightOfViewBetweenTitleAndField: NSLayoutConstraint?
    
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var txtField: UITextView!
    @IBOutlet weak private var viewIndicator: UIView!
    @IBOutlet weak private var imgIconDown: UIImageView!
    @IBOutlet weak open var txtOther:TextFieldView!
    @IBOutlet weak private var viewBetweenTitleAndField:UIView?
    
    //
    @objc open dynamic var style = TextViewStyle.init(){
        didSet{
            if let style:TextViewStyle = style as? TextViewStyle {
                self.spaceBetweenFieldAndIndicator = style.spaceBetweenFieldAndIndicator;
                self.spaceBetweenTitleAndField = style.spaceBetweenTitleAndField;
            }
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
            self.txtField.placeholder = placeholder;
        }
    }
    open var spaceBetweenFieldAndIndicator:CGFloat=0{
        didSet{
            self.layoutConstraintHeightOfViewBetweenFieldAndIndicator?.constant = spaceBetweenFieldAndIndicator;
        }
    }
    open var spaceBetweenTitleAndField:SpaceStyle = .auto{
        didSet{
            switch spaceBetweenTitleAndField{
            case .auto:
                self.updateSpaces();
            case .cutome(let value):
                self.layoutConstraintHeightOfViewBetweenTitleAndField?.constant = value;
            }
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
    open override func layoutSubviews() {
        super.layoutSubviews();
        self.txtField.textContainer.lineFragmentPadding = 0
        // this for padding from top and bottom and left and right
        self.txtField.textContainerInset = .zero
        self.txtField.delegate=self;
        
        
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.layoutConstraintHeightOfIndicator.constant = self.style.indicatorHeight;
        normalStyle()
        let tempStyle = self.style
        self.style = tempStyle;
        //        self.layoutConstraintHeightOfViewBetweenFieldAndIndicator?.constant = spaceBetweenFieldAndIndicator;
        //        self.layoutConstraintHeightOfViewBetweenTitleAndField?.constant = spaceBetweenTitleAndField;
        
        let tempIcon = self.icon;
        self.icon = tempIcon;
        
        
    }
    
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
            self.viewBetweenTitleAndField?.isHidden=false;
            switch self.style.spaceBetweenTitleAndField {
            case .auto:
                self.updateSpaces();
                break;
            case .cutome(_):
                break;
            }
        })
    }
    func hideLabelTitle(){
        UIView.animate(withDuration:0.3, animations: {
            self.lblTitle.isHidden=true;
            self.viewBetweenTitleAndField?.isHidden=true;
            switch self.style.spaceBetweenTitleAndField {
            case .auto:
                self.updateSpaces();
                break;
            case .cutome(_):
                break;
            }
        })
    }
    func updateSpaces(){
        let value = self.caluclateSpace(self.txtOther)
        self.spaceBetweenFieldAndIndicator = value
        self.layoutConstraintHeightOfViewBetweenTitleAndField?.constant = value
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
    public func textViewDidChange(_ textView: UITextView) {
        textView.textViewDidChange(textView);
    }
}

