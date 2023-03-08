//
//  TextViewView.swift
//  CheckBoxSelectionKitExample
//
//  Created by Salah on 9/22/20.
//  Copyright © 2020 Salah. All rights reserved.
//


import UIKit

// MARK:  default = 7
public enum SpaceStyle{
    // MARK:  calclaute TextView spaces depend on TextField
    case auto // MARK: for space between (TitleAndField) and (FieldAndIndicator)
    case cutome(CGFloat)
}
@objcMembers
public class TextViewStyle:FieldStyle{
    // MARK: you can't use spaceBetweenFieldAndIndicator while you use spaceBetweenTitleAndField = auto
    open var spaceBetweenFieldAndIndicator:CGFloat=0
    open var spaceBetweenTitleAndField:SpaceStyle = .auto
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let copy = TextViewStyle()
        return copy
    }
    
}
@objcMembers
open class TextViewView:UIView,FieldDataProrocol,FieldStyleProrocol {
    public var onEditingChanged: OnEditingValiadtionChanged?
    
    // MARK:Customisable
    public var nibName:String{
        return "TextViewView";
    }
    func caluclateSpace(_ textfield:TextFieldView?)->CGFloat?{
        if let textfield:TextFieldView = textfield{
        var heightOfTextInsideTextField = "a".height(withConstrainedWidth: 200, font: textfield.txtField.font!)
        var heightOfTitle = "a".height(withConstrainedWidth: 200, font: textfield.lblTitle.font!)
        return (textfield.frame.height - heightOfTextInsideTextField - heightOfTitle)/2
        }
        return nil;
    }
    // private
    private var contentView : UIView?
    @IBOutlet weak open var layoutConstraintHeightOfViewBetweenFieldAndIndicator: NSLayoutConstraint?
    @IBOutlet weak open var layoutConstraintHeightOfViewBetweenTitleAndField: NSLayoutConstraint?
    
    @IBOutlet weak open var lblTitle: UILabel!
    @IBOutlet weak open var lblError: UILabel!
    @IBOutlet weak open var txtField: UITextView!
    @IBOutlet weak open var imgIcon: UIImageView!
    @IBOutlet weak open var viewBetweenTitleAndField:UIView?
    // MARK:Optional
    // txtOther calclaute TextView spaces depend on TextField
    @IBOutlet weak open var txtOther:TextFieldView?
    @IBOutlet weak private var viewIndicator: UIView?
    @IBOutlet weak private var layoutConstraintHeightOfIndicator: NSLayoutConstraint?

    @objc open dynamic var style = TextViewStyle.init(){
        didSet{
            self.setSpacesCalculations();
            self.lblTitle.font = self.style.titleFont ?? self.lblTitle.font;
            self.txtField.font = self.style.textFont ?? self.txtField.font
            self.lblError.textColor = style.errorColor;
            self.lblError.font = style.errorFont;
            if self.isFirstResponder{
                self.selectedStyle();
            }else
            if self.txtField.text?.count ?? 0 == 0{
                self.normalStyle();
            }else{
                self.filledStyle();
            }
            self.indicatorHeight = self.style.indicatorHeight;
        }
    }
    open var placeholder:String?{
        didSet{
            self.lblTitle.text = placeholder
            self.txtField.placeholder = placeholder;
        }
    }
    var textRepository:String?
    open var text:String?{
        set{
            self.txtField?.text = newValue;
            self.didEndEditing(text);
            if self.txtField == nil {
                textRepository = newValue
            }
        }
        get{
            if self.txtField == nil {
            return textRepository
            }else{
                return self.txtField.text;
            }
        }
     }
    open var error: String?{
        didSet{
            self.lblError?.isHidden = ((self.error?.count ?? 0) > 0) ? false:true
            self.lblError?.text = error;
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
            self.imgIcon.image=icon;
            self.imgIcon.superview?.isHidden = (self.imgIcon.image == nil)
        }
    }
    public var indicatorHeight:CGFloat=1{
        didSet{
            self.layoutConstraintHeightOfIndicator?.constant = indicatorHeight
        }
    }
    open var fieldDidEnd:FieldHandler?=TextViewView.fieldDidEnd
    open var fieldDidChange:FieldHandler?//=TextViewView.fieldDidChange
    open var fieldDidBeginEditing:FieldHandler?//=TextViewView.fieldDidBeginEditing
    
    public static var fieldDidEnd:FieldHandler?
    public static var fieldDidChange:FieldHandler?
    public static var fieldDidBeginEditing:FieldHandler?
    
    public init() {
        super.init(frame: CGRect.init())
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
        var module:Bundle?
        if String.fieldsType.contains(nibName){
            module = Bundle.module;
        }
        let nib = UINib(nibName:self.nibName, bundle:module)
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
        self.lblError.isHidden=true;

        normalStyle()
        let tempIcon = self.icon;
        self.icon = tempIcon;
    }
    
    @IBAction func btnAction(_ sender:UIButton){
    }
    func setup(){
        
    }
    // MARK:Customisable
    open func cutomLayoutSubviews(){
        
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
    // MARK:Customisable
    open func setSpacesCalculations(){
         if let style:TextViewStyle = style as? TextViewStyle {
             self.spaceBetweenFieldAndIndicator = style.spaceBetweenFieldAndIndicator;
             self.spaceBetweenTitleAndField = style.spaceBetweenTitleAndField;
         }
     }
    private func indicatorColor(_ color:UIColor?){
        UIView.animate(withDuration:0.2, animations: {
            self.viewIndicator?.backgroundColor=color
        })
    }
    private func showLabelTitle(){
//        UIView.animate(withDuration:0.3, animations: {
            self.lblTitle.isHidden=false;
            self.viewBetweenTitleAndField?.isHidden=false;
            switch self.style.spaceBetweenTitleAndField {
            case .auto:
                self.updateSpaces();
                break;
            case .cutome(_):
                break;
            }
//        })
    }
    private func hideLabelTitle(){
//        UIView.animate(withDuration:0.3, animations: {
            self.lblTitle.isHidden=true;
            self.viewBetweenTitleAndField?.isHidden=true;
            switch self.style.spaceBetweenTitleAndField {
            case .auto:
                self.updateSpaces();
                break;
            case .cutome(_):
                break;
            }
//        })
    }
    func updateSpaces(){
        if let value:CGFloat = self.caluclateSpace(self.txtOther){
        self.spaceBetweenFieldAndIndicator = value
        self.layoutConstraintHeightOfViewBetweenTitleAndField?.constant = value
        }else{
            self.spaceBetweenFieldAndIndicator = 7.0
            self.layoutConstraintHeightOfViewBetweenTitleAndField?.constant = 7.0
        }
    }
    private func didEndEditing(_ text:String?){
        if (text?.count ?? 0) == 0{
        self.normalStyle();
        }else{
        filledStyle();
        }
    }
}
extension TextViewView:UITextViewDelegate{
    public func textViewDidBeginEditing(_ textView: UITextView) {
        self.selectedStyle();
        fieldDidBeginEditing?(self);
    }
    public func textViewDidEndEditing(_ textView: UITextView) {
        self.didEndEditing(textView.text);
        fieldDidEnd?(self);
    }
    public func textViewDidChange(_ textView: UITextView) {
        textView.textViewDidChange(textView);
        fieldDidChange?(self);
    }
}

