//
//  TextFieldView.swift
//  CheckBoxSelectionKitExample
//
//  Created by Salah on 9/22/20.
//  Copyright © 2020 Salah. All rights reserved.
//


import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
public class FieldColorStyle:NSCopying{
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = FieldColorStyle()
        return copy
    }
    public var textColor:UIColor?
    public var indicatorColor:UIColor?
    public var titleColor:UIColor?
    public init(_ textColor:UIColor,_ indicatorColor:UIColor,_ titleColor:UIColor) {
        self.textColor=textColor
        self.indicatorColor=indicatorColor
        self.titleColor=titleColor;
    }
    init(){
        
    }
}
@objc open class FieldStyle:NSObject,NSCopying{
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = FieldStyle()
        return copy
    }
    public var autoHideTitle:Bool=true;
    public var indicatorHeight:CGFloat=1
    public var titleFont:UIFont?
    public var textFont:UIFont?
    public var normal:FieldColorStyle?
    public var selected:FieldColorStyle?
    public var filled:FieldColorStyle?
    public var spaceBetweenIconAndField:CGFloat=8

    public override init() {
        super.init();
    }
}
open class TextFieldView: UIView {
     // private
     private var contentView : UIView?
     @IBOutlet weak private var layoutConstraintHeightOfIndicator: NSLayoutConstraint!
     @IBOutlet weak  var lblTitle: UILabel!
     @IBOutlet weak open var txtField: UITextField!
     @IBOutlet weak private var viewIndicator: UIView!
     @IBOutlet weak private var imgIconDown: UIImageView?
     @IBOutlet weak private var stackViewIcon: UIStackView?

     @objc open dynamic var style = FieldStyle.init(){
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
    open var icon:UIImage?{
         didSet{
            self.imgIconDown?.image=icon;
            self.imgIconDown?.superview?.isHidden = (self.imgIconDown?.image == nil)

         }
     }
    public var spaceBetweenIconAndField:CGFloat=8{
        didSet{
            self.stackViewIcon?.directionalLayoutMargins = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing:spaceBetweenIconAndField)
        }
    }
    public var indicatorHeight:CGFloat=1{
        didSet{
            self.layoutConstraintHeightOfIndicator.constant = indicatorHeight
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
        self.txtField.addTarget(self, action: #selector(Self.textFieldDidBegin(_:)), for: .editingDidBegin)
        self.txtField.addTarget(self, action: #selector(Self.textFieldDidEnd(_:)), for: .editingDidEnd)
        self.txtField.addTarget(self, action: #selector(Self.textFieldValueChanged(_:)), for: .valueChanged)
        
//        let tempStyle = self.style
//        self.style = tempStyle;
        
        normalStyle()
        let tempIcon = self.icon;
        self.icon = tempIcon;

    }
    @objc func textFieldValueChanged(_ txt:UITextField){
    }
    @objc func textFieldDidBegin(_ txt:UITextField){
        self.selectedStyle();
    }
    @objc func textFieldDidEnd(_ txt:UITextField){
        self.endEditingField(txt.text);
    }
    @IBAction func btnAction(_ sender:UIButton){
    }
    func setup(){
        
    }
    func endEditingField(_ text:String?){
        if (text?.count ?? 0) == 0{
        self.normalStyle();
        }else{
        filledStyle();
        }
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
//        UIView.transition(with: lblTitle, duration: 0.3,
//                          options: .allowAnimatedContent,
//                          animations: {
            self.lblTitle.isHidden=false;
//                      })
    }
    func hideLabelTitle(){
//        UIView.transition(with: lblTitle, duration: 0.3,
//                          options: .allowAnimatedContent,
//                          animations: {
            self.lblTitle.isHidden=true;
//                      })
    }
}
