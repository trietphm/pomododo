//
//  BreakTime.swift
//  pomododo
//
//  Created by triet on 3/3/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI

struct BreakTimeView: View {
    let randomImage = ["1", "2", "3"]
    
    var body: some View {
        ZStack {
            Image(randomImage[Int.random(in: 0...2)])
                .resizable()
                .frame(height: 800)
            
            VStack {

                Spacer()
                Text("Go outside.")
                    .font(.system(size: 45))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                
                Text("4:32")
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
}

struct BreakTime_Previews: PreviewProvider {
    static var previews: some View {
        BreakTimeView()
    }
}
