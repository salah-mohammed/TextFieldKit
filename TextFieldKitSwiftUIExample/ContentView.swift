//
//  ContentView.swift
//  TextFieldKitSwiftUIExample
//
//  Created by Salah on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            SUITextFieldView(placeholder:"Username",text:"aa",error:"a", iconName:"ic_setting_phone");
            SUITextFieldView(placeholder:"Fullname",text:"aa",error:"a");
            SUITextFieldView(placeholder:"FirstName",text:"aa");

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct SUITextFieldView: View {
    @State var placeholder:String
    @State var text:String
    @State var error:String?
    @State var iconName:String?
    var onEditingChanged:((Bool) -> Void)?
    @State private var changed:Bool=false;

    var body: some View {
        ZStack{
            VStack(spacing:5){
                if $text.wrappedValue.count > 0{
                    VStack{Text("Username").font(Font.system(size: 13)).frame(maxWidth:.infinity,alignment:.leading)}
                }
                HStack{
                    if let iconName:String = iconName{
                        Image(iconName)
                    }
                    TextField(placeholder, text:$text, onEditingChanged: { (changed) in
                        self.changed=changed
                        self.onEditingChanged?(changed);
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
                }
            Rectangle.init()
                    .frame(height:2)
                    .foregroundColor($changed.wrappedValue ? Color.green: Color.black)
                if let iconName:String = iconName{
                    VStack{Text("empty data").foregroundColor(Color.red).frame(maxWidth:.infinity,alignment:.leading).font(Font.system(size: 11))}
                }
            }.onTapGesture {
                
            }
        }
    }
}
