//
//  FieldStyle.swift
//  TextFieldKit
//
//  Created by Salah on 9/30/22.
//

import UIKit

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
    public var errorColor:UIColor=UIColor.red
    public var errorFont:UIFont=UIFont.systemFont(ofSize: 11, weight:.regular)
    public override init() {
        super.init();
    }
}
