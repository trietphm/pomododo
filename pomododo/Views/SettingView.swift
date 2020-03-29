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
    }
}

struct SettingTextFieldNumberStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font
                .custom("Arial Rounded MT Bold", size: 14)
                .weight(.light))
            .padding()
            .border(Color.black, width: 1)
            .cornerRadius(2)
    }
}


struct SettingView: View {
    @EnvironmentObject var settings: Setting

    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                Text("Settings")
                    .font(Font
                        .custom("Arial Rounded MT Bold", size: 30)
                        .weight(.light))
                    .padding(.bottom)
                

                HStack(spacing: 31) {
                    Text("Session Length (Minutes)")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("25", value: $settings.sessionLength, formatter: NumberFormatter())
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldNumberStyle())
                }
                HStack(spacing: 18) {
                    Text("Short break length (Minutes)")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("5", value: $settings.shortBreakLength, formatter: NumberFormatter())
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldNumberStyle())
                }
                HStack(spacing: 46) {
                    Text("Long break (Minutes)")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("15", value: $settings.longBreakLength, formatter: NumberFormatter())
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldNumberStyle())
                }
            }
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding([.leading,.trailing])
        }
            .frame(width: 550, height: 300)
        .offset(y: -10)
    }
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(Setting())
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
