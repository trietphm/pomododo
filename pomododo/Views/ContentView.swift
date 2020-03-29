//
//  ContentView.swift
//  pomododo
//
//  Created by triet on 3/1/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var settings: Setting
    
    var body: some View {
        ContentInternalView(PomoTimer(remainSessionDuration: settings.sessionLength))
    }
}

struct ContentInternalView: View {
    @EnvironmentObject var settings: Setting
    @ObservedObject var pomoTimer: PomoTimer

    @State var isRunning = false
    @State private var showSetting = false

    init(_ pomoTimer: PomoTimer) {
        self.pomoTimer = pomoTimer
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.init(red: 53/255, green: 37/255, blue: 175/255),
                    Color.init(red: 198/255, green: 108/255, blue: 215/255)
                ]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing)
            .frame(height: 350) // This is to cover the title bar
            
            VStack {
                
                //.padding(.trailing)
                
                VStack {
                    HStack(alignment: .center) {
                        Text("\(self.pomoTimer.displayTimer())")
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
                            self.pomoTimer.start(self.openBreakTimeView)
                        }) {
                            Text("START")
                                .modifier(MainTextButtonStyle())
                        }
                        .buttonStyle(MainButtonStyle())
                        
                        Button(action: {
                            self.pomoTimer.reset()
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
                    
                    Text("\(self.pomoTimer.sessionCount)/10")
                        .fontWeight(.light)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                }

                HStack() {
                    Spacer()
                    Button(action: {
                        self.openSettingView()
                    }) {
                        Image("gear-64")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 24, height: 24)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding([.trailing, .leading])
        }
        .frame(width: 400, height: 300)
        .offset(y: -5)
        
    }
    
    func openBreakTimeView() {
        let controller = WindowController(rootView: BreakTimeView().environmentObject(self.settings))
        controller.window?.titlebarAppearsTransparent = true
        controller.showWindow(nil)
    }
    
    func openSettingView() {
        let controller = WindowController(
            rootView: SettingView(
                location: self.settings.sessionLength).environmentObject(self.settings
            )
        )
        controller.window?.titlebarAppearsTransparent = true
        controller.showWindow(nil)
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
            .environmentObject(Setting())
    }
}
