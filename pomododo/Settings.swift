//
//  settings.swift
//  pomododo
//
//  Created by triet on 3/1/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI

struct TextLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font
                .custom("Arial Rounded MT Bold", size: 16)
                .weight(.ultraLight))
            .foregroundColor(.white)
    }
}

struct SettingTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font
                .custom("Arial Rounded MT Bold", size: 14)
                .weight(.light))
            .foregroundColor(.white)
            .padding()
            .border(Color.white, width: 1.5)
            .cornerRadius(1.5)
            .background(
                Color(red: 37/255, green: 42/255, blue: 47/255))
            .cornerRadius(1.5)
    }
}

struct Settings: View {
    @State var sessionLength: String = "25"
    @State var shortBreakLength: String = "5"
    @State var longBreakLength: String = "10"
    
    var body: some View {
        ZStack {
            Color(red: 37/255, green: 42/255, blue: 47/255)
            
            VStack(spacing: 15) {
                Text("Settings")
                    .font(Font
                        .custom("Arial Rounded MT Bold", size: 30)
                        .weight(.light))
                    .foregroundColor(.white)
                    .padding(.bottom)
                

                HStack(spacing: 31) {
                    Text("Session Length (Minutes)")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("25", text: $sessionLength)
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldStyle())
                }
                HStack(spacing: 18) {
                    Text("Short break length (Minutes)")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("5", text: $shortBreakLength)
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldStyle())
                }
                HStack(spacing: 46) {
                    Text("Long break (Minutes)")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("15", text: $longBreakLength)
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldStyle())
                }
            }
            .frame(width: 550, height: 300)
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding([.leading,.trailing])
        }
    }
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
