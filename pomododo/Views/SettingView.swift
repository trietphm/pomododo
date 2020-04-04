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
    @State private var localSetting = Setting()
    
    var body: some View {
        self.localSetting = self.settings
        return ZStack {
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
                    TextField("25", text: Binding<String>(
                        get: { String(self.localSetting.sessionLength) },
                        set: { self.setBinding(v: $0, localValue:  &self.localSetting.sessionLength, settingValue: &self.settings.sessionLength) }
                    ))
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldNumberStyle())
                }
                HStack(spacing: 18) {
                    Text("Short break length (Minutes)")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("5", text: Binding<String>(
                        get: { String(self.localSetting.shortBreakLength) },
                        set: { self.setBinding(v: $0, localValue:  &self.localSetting.shortBreakLength, settingValue: &self.settings.shortBreakLength) }
                    ))
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldNumberStyle())
                }
                HStack(spacing: 46) {
                    Text("Long break (Minutes)")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("15", text: Binding<String>(
                        get: { String(self.localSetting.longBreakLength) },
                        set: { self.setBinding(v: $0, localValue:  &self.localSetting.longBreakLength, settingValue: &self.settings.longBreakLength) }
                    ))
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldNumberStyle())
                }
                HStack(spacing: 34) {
                    Text("Sessions for Long break")
                        .modifier(TextLabelStyle())
                    Spacer()
                    TextField("5", text: Binding<String>(
                        get: { String(self.localSetting.sessionsForLongBreak) },
                        set: { self.setBinding(v: $0, localValue:  &self.localSetting.sessionsForLongBreak, settingValue: &self.settings.sessionsForLongBreak) }
                    ))
                        .textFieldStyle(PlainTextFieldStyle())
                        .modifier(SettingTextFieldNumberStyle())
                }
                
                Button(action: {
                    self.settings.isOpenningSetting = false
                    NSApplication.shared.keyWindow?.close()
                }) {
                    Text("SAVE")
                        .fontWeight(.medium)
                        .frame(width: 120, height: 10)
                        .padding(.all)
                        .border(Color.black, width: 1)
                        .cornerRadius(2.0)
                }
                .buttonStyle(PlainButtonStyle())
            }
                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding([.leading,.trailing])
        }
        .frame(width: 550, height: 390)
    }
    
    func setBinding(v: String, localValue: inout Int, settingValue: inout Int) {
        if let newValue = NumberFormatter().number(from: v) {
            localValue = newValue.intValue
        }
        settingValue = localValue
    }
}

func windowWillClose(_ notification: Notification) {
    print("willClose")
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        let setting = Setting()
        return SettingView()
            .environmentObject(setting)
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
