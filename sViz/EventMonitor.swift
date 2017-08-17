//
//  EventMonitor.swift
//  sViz
//
//  Created by Martin Havig on 17/08/2017.
//  Copyright © 2017 Cake. All rights reserved.
//

import Cocoa

class EventMonitor {
    var mask: NSEventMask
    var handler: (NSEvent?) -> ()
    var monitor: Any?
    
    init(mask: NSEventMask, handler: @escaping (NSEvent?) -> ()){
        self.mask = mask
        self.handler = handler
    }

    deinit{
        stop()
    }
    
    func start(){
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    func stop(){
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
