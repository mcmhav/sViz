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

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
//            button.action = #selector(AppDelegate.buttonWasPressed)
            button.action = #selector(AppDelegate.togglePopover(sender:))
        }
//
//        let menu = NSMenu()
//        
//        menu.addItem(NSMenuItem(title: "Action 1", action: #selector(AppDelegate.action1(sender:)), keyEquivalent: "e"))
//        menu.addItem(NSMenuItem.separator())
//        menu.addItem(NSMenuItem(title: "Action 2", action: #selector(AppDelegate.action2(sender:)), keyEquivalent: "k"))
//        
//        statusItem.menu = menu
        popover.contentViewController = StoryboardBasedController.loadFromStoryboard()

    }

    
    func togglePopover(sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
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

