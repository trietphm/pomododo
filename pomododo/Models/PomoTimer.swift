//
//  Timer.swift
//  pomododo
//
//  Created by triet on 3/23/20.
//  Copyright © 2020 triet. All rights reserved.
//

import Foundation
import SwiftUI

class PomoTimer: ObservableObject {
    @Published var remainSessionDuration: Int
    @Published var timer: Timer?
    @Published var isRunning = false
    private var defaultSessionDuration: Int
    
    init(remainSessionDuration: Int) {
        self.defaultSessionDuration = remainSessionDuration
        self.remainSessionDuration = remainSessionDuration
    }
    
    func displayTimer() -> String {
        let minutes = self.remainSessionDuration / 60
        let seconds = self.remainSessionDuration % 60
        
        return "\(properNumber(minutes)):\(properNumber(seconds))"
    }
    
    func properNumber(_ num: Int) -> String {
        return num < 10 ? "0\(num)" : "\(num)"
    }
    
    func start(_ closure: @escaping()-> Void) {
        self.isRunning = true
        self.countDown(closure)
    }
    
    func reset() {
        self.isRunning = false
        self.remainSessionDuration = self.defaultSessionDuration
        
        if self.timer != nil {
            self.timer!.invalidate()
        }
    }

    func countDown(_ closure: @escaping() -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {timer in
            self.remainSessionDuration -= 1
            if self.remainSessionDuration == 0 {
                self.remainSessionDuration = self.defaultSessionDuration
                timer.invalidate()
                
                closure()
            }
        }
    }
    
}
