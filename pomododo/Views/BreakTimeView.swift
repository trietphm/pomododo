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
    
    var body: some View {
        BreakTimeInternalView(PomoTimer(remainSessionDuration: settings.shortBreakLength)
        )
    }
}

struct BreakTimeInternalView: View {
    let randomImage: String
    @ObservedObject var pomoTimer: PomoTimer
   
    init(_ pomoTimer: PomoTimer) {
        self.pomoTimer = pomoTimer
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
                    NSApplication.shared.keyWindow?.close()
                }) {
                    Text("I'D RATHER WORK")
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .cornerRadius(6.0)
                        .frame(width: 120, height: 10)
                        .padding(.all)
                        .border(Color.white, width: 2)
                }
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(6.0)
                .padding()
            }
            .padding()
        }
        .frame(width: 1100, height: 750)
        .offset(y: -10)
    }
    
    func closeWindow() {
        NSApplication.shared.keyWindow?.close()
    }
}

struct BreakTime_Previews: PreviewProvider {
    static var previews: some View {
        BreakTimeView()
    }
}
