//
//  BreakTime.swift
//  pomododo
//
//  Created by triet on 3/3/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI

struct BreakTimeView: View {
    @EnvironmentObject var settings: Setting
    var isShortBreak: Bool
    
    var body: some View {
        return BreakTimeInternalView(settings, isShortBreak)
    }
}

struct BreakTimeInternalView: View {
    let randomImage: String
    @ObservedObject var localSettings: Setting
    @ObservedObject var pomoTimer: PomoTimer
   
    init(_ settings: Setting, _ isShortBreak: Bool) {
        self.localSettings = settings
        let remainSessionDuration = isShortBreak ? settings.shortBreakLength : settings.longBreakLength;
        self.pomoTimer = PomoTimer(remainSessionDuration: remainSessionDuration)
        self.randomImage = String(Int.random(in: 1...3))
        self.pomoTimer.start(closeWindow)
    }

    var body: some View {
        ZStack {
            Image(randomImage)
                .resizable()
                .frame(height: 800)
            
            VStack {
                Spacer()
                Text("Go outside.")
                    .font(.system(size: 45))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                
                Text("\(self.pomoTimer.displayTimer())")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                
                Button(action: {
                    self.localSettings.isBreakingTime = false
                    NSApplication.shared.keyWindow?.close()
                }) {
                    Text("I'D RATHER WORK")
                        .modifier(BreakTimeTextButtonStyle())
                }
                .buttonStyle(BreakTimeButtonStyle())
            }
            .padding()
        }
        .frame(width: 1100, height: 750)
        .offset(y: -10)
    }
    
    func closeWindow() {
        self.localSettings.isBreakingTime = false
        NSApplication.shared.keyWindow?.close()
    }
}

struct BreakTimeTextButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 120, height: 10)
            .padding(.all)
    }
}

struct BreakTimeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.white : Color.black)
            .background(configuration.isPressed ? Color.purple : Color.white)
            .cornerRadius(6.0)
            .padding(.all)
    }
}

struct BreakTime_Previews: PreviewProvider {
    static var previews: some View {
        BreakTimeView(isShortBreak: true)
            .environmentObject(Setting())
    }
}
