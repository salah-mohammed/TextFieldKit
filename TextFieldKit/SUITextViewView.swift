//
//  SUITextViewView.swift
//  TextFieldKit
//
//  Created by Salah on 10/8/22.
//

import UIKit
import SwiftUI
public typealias OnEditingValiadtionChanged = (Bool,GeneralConnection?) -> Void
@available(iOS 16, *)
public struct SUITextViewView: View {
    public var placeholder:String
    public var text: Binding<String>
    public var error:Binding<String?>?
    @State public var iconName:String?
    public var onEditingChanged:((Bool) -> Void)?
    public var onEditingValidationChanged:((Bool,GeneralConnection?) -> Void)?
    @FocusState private var textFocused: Bool
    public var style:FieldStyle = SUITextViewView.style ?? FieldStyle.init()
    public static var style:FieldStyle?
    public var validation:GeneralConnection?

    public init(placeholder:String?,
                text:Binding<String>,
                error:Binding<String?>?=nil,
                iconName:String?=nil,
                onEditingChanged:((Bool) -> Void)?=nil,
                style:FieldStyle?=nil,
                validation:(GeneralConnection?,((Bool,GeneralConnection?) -> Void)?)?=nil) {
        self.validation = validation?.0
        self.placeholder = placeholder ?? validation?.0?.title ?? ""
        self.onEditingValidationChanged = validation?.1 ?? validation?.0?.onEditingChanged()
        self.text=text;
        self.error=error;
        self.iconName=iconName;
        self.onEditingChanged=onEditingChanged;
        self.style=style ?? SUITextFieldView.style ?? FieldStyle.init()
    }
    func textColor()->Color{
        if textFocused{
            return style.selected?.textColor?.bs_color ?? Color.clear
        }else
        if text.wrappedValue.count > 0{
        return  style.filled?.textColor?.bs_color ?? Color.clear
        }
        return  style.normal?.textColor?.bs_color ?? Color.clear;
    }
    func titleColor()->Color{
        if textFocused{
            return style.selected?.titleColor?.bs_color ?? Color.clear
        }else
        if text.wrappedValue.count > 0{
        return  style.filled?.titleColor?.bs_color ?? Color.clear
        }
        return  style.normal?.titleColor?.bs_color ?? Color.clear;
    }
    func indicatorColor()->Color{
        if textFocused{
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
                        Text(placeholder)
                        .foregroundColor(titleColor())
                        .font(Font.system(size: 13))
                        .frame(maxWidth:.infinity,alignment:.leading)
                    }.onAppear(perform: {
                        UITextView.appearance().textContainer.lineFragmentPadding=0
                        UITextView.appearance().textContainerInset = .zero
                    })
                }
                HStack{
                    if let iconName:String = iconName{
                        VStack{
                        Image(iconName)
                        Spacer()
                        }
                    }
                    ZStack{
                        TextEditor.init(text:text)
                            .padding(.zero)
                            .focused($textFocused)
                            .scrollContentBackground(.hidden)
                            .font(Font.system(size:18, weight: .thin, design: .default))
                            .onChange(of:textFocused, perform: { newValue in
                                self.onEditingChanged?(newValue);
                                self.onEditingValidationChanged?(newValue,self.validation);
                            })
                        if text.wrappedValue.count == 0 {
                            VStack(){
                                HStack{
                                    Text(self.placeholder).foregroundColor(UIColor.placeholderText.bs_color)
                                    Spacer()
                                }
                                Spacer();
                            }
                        }
                    }
                }
            Rectangle.init()
                    .frame(height:self.style.indicatorHeight)
                    .foregroundColor(indicatorColor())
                if let error:String = error?.wrappedValue{
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
