//
//  SUITextFieldView.swift
//  TextFieldKit
//
//  Created by Salah on 10/7/22.
//

import UIKit
import SwiftUI

@available(iOS 15.5, *)
public struct SUITextFieldView: View {
    public var placeholder:String?
    public var text: Binding<String>
    public var error:Binding<String>?
    @State public var iconName:String?
    public var onEditingChanged:((Bool) -> Void)?
    public var onEditingValidationChanged:((Bool,GeneralConnection?) -> Void)?
    @State private var changed:Bool=false;
    public var style:FieldStyle = SUITextFieldView.style ?? FieldStyle.init()
    public static var style:FieldStyle?
    public var validation:GeneralConnection?

    public init(placeholder:String?=nil,
                text:Binding<String>,
                error:Binding<String>?=nil,
                iconName:String?=nil,
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
                HStack(spacing:self.style.spaceBetweenIconAndField){
                    if let iconName:String = iconName{
                        Image(iconName)
                    }
                    TextField(placeholder ?? "n", text:text, onEditingChanged: { (changed) in
                        self.changed=changed
                        self.onEditingChanged?(changed);
                        onEditingValidationChanged?(changed,self.validation);
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }.foregroundColor(textColor())
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
            }.onTapGesture {
                
            }
        }.frame(minHeight:55)
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
