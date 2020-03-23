//
//  Timer.swift
//  pomododo
//
//  Created by triet on 3/23/20.
//  Copyright © 2020 triet. All rights reserved.
//

import Foundation
import SwiftUI

let defaultSessionDuration = 1 * 3
class PomoTimer: ObservableObject {
    @Published var remainSessionDuration = defaultSessionDuration // seconds
    @Published var sessionCount = 0
    @Published var timer: Timer?
    @Published var isRunning = false
    private var showBreakTime = true
    
    init(_ showBreakTime: Bool) {
        self.showBreakTime = showBreakTime
    }
    
    func displayTimer() -> String {
        let minutes = self.remainSessionDuration / 60
        let seconds = self.remainSessionDuration % 60
        
        return "\(properNumber(minutes)):\(properNumber(seconds))"
    }
    
    func properNumber(_ num: Int) -> String {
        return num < 10 ? "0\(num)" : "\(num)"
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
                self.remainSessionDuration = defaultSessionDuration
                timer.invalidate()
                
                // show breaktime view
                if self.showBreakTime {
                    let controller = WindowController(rootView: BreakTimeView())
                    controller.window?.title = "Break Time"
                    controller.showWindow(nil)
                } else {
                    NSApplication.shared.keyWindow?.close()
                }
            }
        }
    }
    
}
