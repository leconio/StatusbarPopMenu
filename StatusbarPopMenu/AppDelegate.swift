//
//  AppDelegate.swift
//  DragPro
//
//  Created by spawn on 2020/11/10.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover = NSPopover()
    private var monitor: Any?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarIcons"))
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = PopMenuViewController.initController()
    }
    
    @objc func printString(_ sender: Any?) {
      print("Hello MacOS")
    }
    
    @objc func togglePopover(_ sender: Any?) {
      if popover.isShown {
        closePopover(sender: sender)
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
        }
        monitor = nil
      } else {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown,.rightMouseDown] ){ [weak self] event in
            if let strongSelf = self, strongSelf.popover.isShown {
              strongSelf.closePopover(sender: event)
            }
        }
        showPopover(sender: sender)
      }
    }

    func showPopover(sender: Any?) {
      if let button = statusItem.button {
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
      }
    }

    func closePopover(sender: Any?) {
      popover.performClose(sender)
    }
}

