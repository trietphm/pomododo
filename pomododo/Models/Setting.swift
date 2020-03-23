//
//  Setting.swift
//  pomododo
//
//  Created by triet on 3/8/20.
//  Copyright © 2020 triet. All rights reserved.
//

import Foundation
import SwiftUI

class Setting: ObservableObject {
    @Published var sessionLength: Int
    @Published var shortBreakLength: Int
    @Published var longBreakLength: Int
    @Published var sessionsForLongBreak: Int
    
    init() {
        self.sessionLength = 25*60
        self.shortBreakLength = 5*60
        self.longBreakLength = 10*60
        self.sessionsForLongBreak = 5
    }
}
