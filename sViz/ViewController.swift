//
//  ViewController.swift
//  sViz
//
//  Created by Martin Havig on 16/08/2017.
//  Copyright © 2017 Cake. All rights reserved.
//

import Cocoa

class StoryboardBasedController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    class func loadFromStoryboard() -> StoryboardBasedController{
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: "har") as! StoryboardBasedController
    }
}
