//
//  ContentView.swift
//  pomododo
//
//  Created by triet on 3/1/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI

struct PurpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.white : Color.black)
            .background(configuration.isPressed ? Color.purple : Color.white)
            .cornerRadius(6.0)
            .padding(.all, 3)
    }
}

struct ContentView: View {
    @State var isRunning = false
    @State var remainSessionDuration = 30 * 60
    @State var timer: Timer?
    @State var sessionCount = 0

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
                            self.isRunning = true
                            self.countDown()
                        }) {
                            Text("START")
                                .fontWeight(.medium)
                                .frame(width: 120, height: 10)
                                .padding(.all)
                        }
                        .buttonStyle(PurpleButtonStyle())
                        
                        Button(action: {
                            self.isRunning = false
                            self.remainSessionDuration = 30*60
                            
                            if self.timer != nil {
                                self.timer!.invalidate()
                            }
                        }) {
                            Text("RESET")
                                .fontWeight(.medium)
                                .frame(width: 120, height: 10)
                                .padding(.all)
                        }
                        .buttonStyle(PurpleButtonStyle())
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
                        print(Text("Heloo"))
                    }) {
                        Image("gear-64")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing)
                }
                //.offset(x: -10, y: -40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func countDown() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {timer in
            self.remainSessionDuration -= 1
            if self.remainSessionDuration == 0 {
                timer.invalidate()
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
