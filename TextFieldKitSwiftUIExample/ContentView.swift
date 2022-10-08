//
//  ContentView.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/4/22.
//

import SwiftUI
import TextFieldKit
public extension UIApplication {
     func endEditing() {
        let keyWindow = connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        keyWindow?.endEditing(true)
    }
}
struct ContentView: View {
    var body: some View {
        ZStack{
            VStack(spacing:0) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                SUITextFieldView(placeholder:"Username",text:"aa",error:"a", iconName:"ic_setting_phone");
                SUITextFieldView(placeholder:"Fullname",text:"aa",error:"a");
                SUITextFieldView(placeholder:"FirstName",text:"aa");
                SUITextViewView.init(placeholder:"Email", text:"salah.mohamed@hotmail.com",iconName:"ic_setting_phone")
            }
            .padding()
        }.frame(maxWidth:.infinity,maxHeight:.infinity).background(Color.gray.opacity(0.5)).gesture(TapGesture()
            .onEnded { _ in
                UIApplication.shared.endEditing();
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


public struct SUITextViewView: View {
    @State public var placeholder:String
    @State public var text:String
    @State public var error:String?
    @State public var iconName:String?
    public var onEditingChanged:((Bool) -> Void)?
    @FocusState private var textFocused: Bool
    public var style:FieldStyle = SUITextFieldView.style ?? FieldStyle.init()
    static var style:FieldStyle?
    
    func textColor()->Color{
        if textFocused{
            return style.selected?.textColor?.bs_color ?? Color.clear
        }else
        if text.count > 0{
        return  style.filled?.textColor?.bs_color ?? Color.clear
        }
        return  style.normal?.textColor?.bs_color ?? Color.clear;
    }
    func titleColor()->Color{
        if textFocused{
            return style.selected?.titleColor?.bs_color ?? Color.clear
        }else
        if text.count > 0{
        return  style.filled?.titleColor?.bs_color ?? Color.clear
        }
        return  style.normal?.titleColor?.bs_color ?? Color.clear;
    }
    func indicatorColor()->Color{
        if textFocused{
            return style.selected?.indicatorColor?.bs_color ?? Color.clear
        }else
        if text.count > 0{
        return  style.filled?.indicatorColor?.bs_color ?? Color.clear
        }
        return  style.normal?.indicatorColor?.bs_color ?? Color.clear;
    }
    public var body: some View {
        ZStack{
            VStack(spacing:5){
                if self.style.autoHideTitle == false || ($text.wrappedValue.count > 0 && self.style.autoHideTitle){
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
                    TextEditor.init(text:$text)
                        .padding(.zero)
                        .focused($textFocused)
                        .scrollContentBackground(.hidden)
                        .font(Font.system(size:18, weight: .thin, design: .default))
                }
            Rectangle.init()
                    .frame(height:self.style.indicatorHeight)
                    .foregroundColor(indicatorColor())
                if let error:String = error{
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


extension UIColor{
    var bs_color:Color{
        return Color(self);
    }
}
public struct SUITextFieldView: View {
    @State public var placeholder:String
    @State public var text:String
    @State public var error:String?
    @State public var iconName:String?
    public var onEditingChanged:((Bool) -> Void)?
    @State private var changed:Bool=false;
    public var style:FieldStyle = SUITextFieldView.style ?? FieldStyle.init()
    static var style:FieldStyle?

    func textColor()->Color{
        if changed{
            return style.selected?.textColor?.bs_color ?? Color.clear
        }else
        if text.count > 0{
        return  style.filled?.textColor?.bs_color ?? Color.clear
        }
        return  style.normal?.textColor?.bs_color ?? Color.clear;
    }
    func titleColor()->Color{
        if changed{
            return style.selected?.titleColor?.bs_color ?? Color.clear
        }else
        if text.count > 0{
        return  style.filled?.titleColor?.bs_color ?? Color.clear
        }
        return  style.normal?.titleColor?.bs_color ?? Color.clear;
    }
    func indicatorColor()->Color{
        if changed{
            return style.selected?.indicatorColor?.bs_color ?? Color.clear
        }else
        if text.count > 0{
        return  style.filled?.indicatorColor?.bs_color ?? Color.clear
        }
        return  style.normal?.indicatorColor?.bs_color ?? Color.clear;
    }
    public var body: some View {
        ZStack{
            VStack(spacing:5){
                if self.style.autoHideTitle == false || ($text.wrappedValue.count > 0 && self.style.autoHideTitle){
                    VStack{
                        Text(placeholder)
                        .foregroundColor(titleColor())
                        .font(Font.system(size: 13))
                        .frame(maxWidth:.infinity,alignment:.leading)
                    }
                }
                HStack(spacing:self.style.spaceBetweenIconAndField){
                    if let iconName:String = iconName{
                        Image(iconName)
                    }
                    TextField(placeholder, text:$text, onEditingChanged: { (changed) in
                        self.changed=changed
                        self.onEditingChanged?(changed);
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }.foregroundColor(textColor())
                }
            Rectangle.init()
                    .frame(height:self.style.indicatorHeight)
                    .foregroundColor(indicatorColor())
                if let error:String = self.error{
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
