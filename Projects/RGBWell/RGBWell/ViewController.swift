//
//  ViewController.swift
//  RGBWell
//
//  Created by Shilpa Bhat on 12/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var redValue:Float = 1
    var greenValue:Float = 1
    var blueValue:Float = 1

    @IBOutlet weak var colorWell: NSColorWell!
    
    
    func updateColorWell() {
        
        let color = NSColor(calibratedRed: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 0.5)
        colorWell.color = color
    }
    @IBAction func adjustRed(_ sender: NSSlider) {
        self.redValue = sender.floatValue
        self.updateColorWell()
    }
    
    @IBAction func adjustGreen(_ sender: NSSlider) {
        self.greenValue = sender.floatValue
        self.updateColorWell()
    }
    
    @IBAction func adjustBlue(_ sender: NSSlider) {
        self.blueValue = sender.floatValue
        self.updateColorWell()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

