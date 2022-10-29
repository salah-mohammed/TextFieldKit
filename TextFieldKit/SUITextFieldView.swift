//
//  SUITextFieldView.swift
//  TextFieldKit
//
//  Created by Salah on 10/7/22.
//

import UIKit
import SwiftUI
public typealias DropDownData = (imageName:String?, spaceBettwenTextAndImage:CGFloat?,tralling:CGFloat?,action:()->Void);
@available(iOS 15.5, *)
public struct SUITextFieldView: View {
    public var placeholder:String?
    public var text: Binding<String>
    public var error:Binding<String>?
    public var iconName:String?
    public var onEditingChanged:((Bool) -> Void)?
    public var onEditingValidationChanged:((Bool,GeneralConnection?) -> Void)?
    @State private var changed:Bool=false;
    public var style:FieldStyle = SUITextFieldView.style ?? FieldStyle.init()
    public static var style:FieldStyle?
    public var validation:GeneralConnection?
    private var dropDownData:DropDownData?

    
    public init(placeholder:String?=nil,
                text:Binding<String>,
                error:Binding<String>?=nil,
                iconName:String?=nil,
                dropDownData:DropDownData?=nil,
                onEditingChanged:((Bool) -> Void)?=nil,
                style:FieldStyle?=nil,
                validation:(GeneralConnection,(Bool,GeneralConnection?) -> Void)?=nil) {
//        self.validation?.text = text
        self.validation = validation?.0
        self.placeholder = placeholder ?? validation?.0.fieldType.title
        self.onEditingValidationChanged = validation?.1
        self.text=text;
        self.error=error;
        self.iconName=iconName;
        self.dropDownData=dropDownData;
        self.onEditingChanged=onEditingChanged;
        self.style=style ?? SUITextFieldView.style ?? FieldStyle.init()
    }
    func textColor()->Color{
        if changed{
            return style.selected?.textColor?.bs_color ?? Color.clear
        }else
        if text.wrappedValue.count > 0{
        return  style.filled?.textColor?.bs_color ?? Color.clear
        }
        return  style.normal?.textColor?.bs_color ?? Color.clear;
    }
    func titleColor()->Color{
        if changed{
            return style.selected?.titleColor?.bs_color ?? Color.clear
        }else
        if text.wrappedValue.count > 0{
        return  style.filled?.titleColor?.bs_color ?? Color.clear
        }
        return  style.normal?.titleColor?.bs_color ?? Color.clear;
    }
    func indicatorColor()->Color{
        if changed{
            return style.selected?.indicatorColor?.bs_color ?? Color.clear
        }else
        if text.wrappedValue.count > 0{
        return  style.filled?.indicatorColor?.bs_color ?? Color.clear
        }
        return  style.normal?.indicatorColor?.bs_color ?? Color.clear;
    }
    public var body: some View {
        ZStack{
            VStack(spacing:5){
                if self.style.autoHideTitle == false || (text.wrappedValue.count > 0 && self.style.autoHideTitle){
                    VStack{
                        Text(placeholder ?? "n")
                        .foregroundColor(titleColor())
                        .font(Font.system(size: 13))
                        .frame(maxWidth:.infinity,alignment:.leading)
                    }
                }
                HStack(spacing:0){
                    HStack(spacing:self.style.spaceBetweenIconAndField){
                        if let iconName:String = iconName{
                            Image(iconName)
                        }
                        TextField(placeholder ?? "", text:text, onEditingChanged: { (changed) in
                            self.changed=changed
                            self.onEditingChanged?(changed);
                            onEditingValidationChanged?(changed,self.validation);
                            print("Username onEditingChanged - \(changed)")
                        }) {
                            print("Username onCommit")
                        }.foregroundColor(textColor()).disabled(dropDownData?.imageName != nil).allowsHitTesting(dropDownData?.imageName == nil)
                    }
                    if let imageName:String=dropDownData?.imageName{
                        Spacer().frame(width:dropDownData?.spaceBettwenTextAndImage ?? 0.0)
                        Image(imageName).padding([.trailing],dropDownData?.tralling)
                    }
                }
            Rectangle.init()
                    .frame(height:self.style.indicatorHeight)
                    .foregroundColor(indicatorColor())
                if let error:String = self.error?.wrappedValue{
                    VStack{
                        Text(error)
                        .foregroundColor(self.style.errorColor.bs_color)
                        .frame(maxWidth:.infinity,alignment:.leading)
                        .font(Font.system(size: 11))
                    }
                }
            }
        }.frame(minHeight:55).highPriorityGesture(
            TapGesture()
                .onEnded { _ in
                    self.dropDownData?.action();
                    print("a")
                }
        ).disabled(false)
    }
}


/*
 protocol ItemViewModel: ObservableObject {
     @Published var title: String

     func save()
     func delete()
 }

 extension ItemViewModel {
     @Published var title = "Some default Title"

     func save() {
         // some default behaviour
     }

     func delete() {
         // some default behaviour
     }
 }
 */
