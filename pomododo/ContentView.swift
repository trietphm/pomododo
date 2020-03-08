//
//  ContentView.swift
//  pomododo
//
//  Created by triet on 3/1/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI

let defaultSessionDuration = 1 * 5

struct ContentView: View {

    @State var isRunning = false
    @State var remainSessionDuration = defaultSessionDuration
    @State var timer: Timer?
    @State var sessionCount = 0
    @State private var showSetting = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.init(red: 53/255, green: 37/255, blue: 175/255),
                    Color.init(red: 198/255, green: 108/255, blue: 215/255)
                ]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing)
            
            VStack {
                
                //.padding(.trailing)
                
                VStack {
                    HStack(alignment: .center) {
                        Text("\(self.displayTimer())")
                            .font(.system(size: 80))
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                    }

                    
                    Text("Work")
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    
                    HStack {
                        Button(action: {
                            self.start()
                        }) {
                            Text("START")
                                .modifier(MainTextButtonStyle())
                        }
                        .buttonStyle(MainButtonStyle())
                        
                        Button(action: {
                            self.reset()
                        }) {
                            Text("RESET")
                                .modifier(MainTextButtonStyle())
                        }
                        .buttonStyle(MainButtonStyle())
                    }
                    .padding()
                    
                    Text("Today's Session")
                        .fontWeight(.light)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                    
                    Text("\(self.sessionCount)/10")
                        .fontWeight(.light)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                }

                HStack() {
                    Spacer()
                    Button(action: {
                        let controller = WindowController(rootView: Settings())
                        controller.window?.title = "Settings"
                        controller.showWindow(nil)
                    }) {
                        Image("gear-64")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .frame(width: 400, height: 300)
    }
    
    func start() {
        self.isRunning = true
        self.countDown()
    }
    
    func reset() {
        self.isRunning = false
        self.remainSessionDuration = defaultSessionDuration
        
        if self.timer != nil {
            self.timer!.invalidate()
        }
    }
    
    func countDown() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {timer in
            self.remainSessionDuration -= 1
            if self.remainSessionDuration == 0 {
                self.sessionCount += 1
                timer.invalidate()
                
                // show breaktime view
                let controller = WindowController(rootView: BreakTime())
                controller.window?.title = "Break Time"
                controller.showWindow(nil)
            }
        }
    }
    
    func displayTimer() -> String {
        let minutes = self.remainSessionDuration / 60
        let seconds = self.remainSessionDuration % 60
        
        return "\(self.properNumber(minutes)):\(self.properNumber(seconds))"
    }
    
    func properNumber(_ num: Int) -> String {
       return num < 10 ? "0\(num)" : "\(num)"
    }
}

struct MainTextButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
            content
                .frame(width: 120, height: 10)
                .padding(.all)
    }
}

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.white : Color.black)
            .background(configuration.isPressed ? Color.purple : Color.white)
            .cornerRadius(6.0)
            .padding(.all, 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
