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
        
        print("hore")

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var hore: NSTextField!
    
    @IBOutlet weak var horeee: NSTextField!
    
    override func viewDidAppear() {
        print("hore viewDidAppear")
        
        let url = URL(string: "https://api.bitfinex.com/v1/pubticker/btcusd")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    let string = String(data: data, encoding: String.Encoding.utf8)
                    
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    print("======") //JSONSerialization
                    print(string!) //JSONSerialization
//                    print(string.mid) //JSONSerialization
                    print("======") //JSONSerialization
                    DispatchQueue.main.async {
                        self.horeee.stringValue = jsonSerialized!["mid"] as! String;
                    }
                    
                    
//                    print(jsonSerialized!["mid"])
                    
                    if let json = jsonSerialized, let url = json["url"], let explanation = json["explanation"] {
                        print(url)
                        print(explanation)
                    }
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
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
