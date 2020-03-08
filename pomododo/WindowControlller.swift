//
//  SettingsWindowControlller.swift
//  pomododo
//
//  Created by triet on 3/8/20.
//  Copyright © 2020 triet. All rights reserved.
//

import SwiftUI
import Cocoa

/// A class to handle opening windows
class WindowController<RootView : View>: NSWindowController {
    convenience init(rootView: RootView) {
        let hostingController = NSHostingController(rootView: rootView)
        let window = NSWindow(contentViewController: hostingController)
        self.init(window: window)
    }
}
