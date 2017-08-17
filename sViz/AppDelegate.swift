//
//  AppDelegate.swift
//  sViz
//
//  Created by Martin Havig on 16/08/2017.
//  Copyright © 2017 Cake. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
    let popover = NSPopover()
    var eventMonitor: EventMonitor?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = #selector(AppDelegate.togglePopover(sender:))
        }

        popover.contentViewController = StoryboardBasedController.loadFromStoryboard()
        
        eventMonitor = EventMonitor(mask: [.leftMouseUp, .rightMouseUp]) { [unowned self] event in
            if self.popover.isShown {
                self.closePopover(sender: event)
            }
        }
    }

    
    func togglePopover(sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    func showPopover(sender: AnyObject?) {
//        if let button = statusItem.button {
//            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
//        }
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            eventMonitor?.start()
        }
    }
    
    func closePopover(sender: AnyObject?) {
//        popover.performClose(sender)
        popover.performClose(sender)
        eventMonitor?.stop()
    }

    func buttonWasPressed(sender: AnyObject) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
    
    func action1(sender: AnyObject) {
        
    }
    
    func action2(sender: AnyObject) {
        
    }
    
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

