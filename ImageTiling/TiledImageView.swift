//
//  TiledImageView.swift
//  ImageTiling
//
//  Created by Shilpa Bhat on 14/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

@IBDesignable
class TiledImageView: NSView {
 
    @IBInspectable var image: NSImage?
    @IBInspectable var columnCount = 5
    @IBInspectable var rowCount = 5
    
    func frameForImageAtLogicalX(_ logicalX: Int, y logicalY: Int) -> CGRect {
        let spacing = 10
        let width = 100
        let height = 100
        let x = (spacing + width) * logicalX
        let y = (spacing + height) * logicalY
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        if let image = image {
            for x in 0..<columnCount {
                for y in 0..<rowCount {
                    let frame = frameForImageAtLogicalX(x, y: y)
                    image.draw(in:frame)
                }
            }
            
        }
    }
}
