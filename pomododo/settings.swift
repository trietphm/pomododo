//
//  settings.swift
//  pomododo
//
//  Created by triet on 3/1/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.blue : Color.white)
            .background(configuration.isPressed ? Color.white : Color.blue)
            .cornerRadius(6.0)
            .padding()
    }
}

struct settings: View {
    var body: some View {
        Button(action: {}) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: 100, maxHeight: 24)
        }
    .buttonStyle(BlueButtonStyle())
    }
}

struct settings_Previews: PreviewProvider {
    static var previews: some View {
        settings()
    }
}
