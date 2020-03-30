//
//  ButtonStyle.swift
//  pomododo
//
//  Created by triet on 3/30/20.
//  Copyright © 2020 triet. All rights reserved.
//

import Foundation
import SwiftUI

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

