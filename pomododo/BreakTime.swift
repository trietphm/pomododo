//
//  BreakTime.swift
//  pomododo
//
//  Created by triet on 3/3/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI

struct BreakTime: View {
    let randomImage = ["1", "2", "3"]
    
    var body: some View {
        ZStack {
            Image(randomImage[Int.random(in: 0...2)])
                .resizable()
            
            VStack {

                Spacer()
                Text("Go outside.")
                    .font(.system(size: 45))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                
                Text("4:32")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .fontWeight(.light)
                
                Button(action: {
                    print(Text("hleoo"))
                }) {
                    Text("I'D RATHER WORK")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 10)
                        .cornerRadius(6.0)
                        .padding(.all)
                        .border(Color.white, width: 2)
                }
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(6.0)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct BreakTime_Previews: PreviewProvider {
    static var previews: some View {
        BreakTime()
    }
}
