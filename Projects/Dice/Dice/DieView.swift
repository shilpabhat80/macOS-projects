//
//  DieView.swift
//  Dice
//
//  Created by Shilpa Bhat on 14/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

@IBDesignable class DieView: NSView, NSDraggingSource {
    
    @IBInspectable var intValue: Int? = 3 {
        didSet {
            needsDisplay = true
        }
    }
    
    var mouseDownEvent: NSEvent?

    
    override func mouseDown(with event: NSEvent) {
        mouseDownEvent = event
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        let backgroundColor = NSColor.lightGray
        backgroundColor.set()
        NSBezierPath.fill(dirtyRect)
        
        self.drawDieWithSize(size: dirtyRect.size)
    }
    
    func drawDieWithSize(size: CGSize) {
        let (edgeLength, dieFrame) = metricsForSize(size: size)
        
        NSColor.white.set()
        let cornerRadious = edgeLength/5.0
        NSBezierPath(roundedRect: dieFrame, xRadius: cornerRadious, yRadius: cornerRadious).fill()
        
        NSColor.black.set()
        let dotRadius = edgeLength / 12.0 * 2.5
        let dotFrame = dieFrame.insetBy(dx: dotRadius, dy: dotRadius)
        
        let shadow = NSShadow()
        shadow.shadowOffset = NSSize(width: 0, height: -1)
        shadow.shadowBlurRadius = edgeLength/20
        shadow.set()
        
        func drawDot(_ u: CGFloat, _ v: CGFloat) {
            let dotOrigin = CGPoint(x: dotFrame.minX + dotFrame.width * u,
                                    y: dotFrame.minY + dotFrame.height * v)
            let dotRect = CGRect(origin: dotOrigin, size: NSZeroSize).insetBy(dx: -dotRadius, dy: -dotRadius)
            NSBezierPath(ovalIn: dotRect).fill()
        }
        
        // If intValue is in range...
        switch intValue! {
        case 1, 3, 5:
            drawDot(0.5, 0.5) // Center dot
        case 6:
            drawDot(0, 0.5) // Mid left/right
            drawDot(1, 0.5)
        case 2..<6:
            drawDot(0, 1) // Upper left
            drawDot(1, 0) // Lower right
        case 4..<6:
            drawDot(1, 1) // Upper right
            drawDot(0, 0) // Lower left
        default:
            break
        }
    }
    
    override var intrinsicContentSize: NSSize {
        return NSSize(width: 20, height: 20)
    }
    
    func metricsForSize(size: CGSize) -> (edgeLength: CGFloat, dieFrame:CGRect) {
        let edgeLength = min(size.width, size.height)
        let padding = edgeLength/10.0
        let drawingBounds = CGRect(x: 0, y: 0, width: edgeLength, height: edgeLength)
        let dieFrame = drawingBounds.insetBy(dx: padding, dy: padding)
        return (edgeLength, dieFrame)
    }
    
    func writeToPasteboard(_ pasteboard:NSPasteboard) {
        
        if let intValue = intValue {
            pasteboard.clearContents()
//            pasteboard.writeObjects(["\(intValue)"])
        }
    }
    
    func readFromPasteboard(_ pasteboard:NSPasteboard) -> Bool {
        let objects = pasteboard.readObjects(forClasses: [NSString.self], options: [:]) as! [String]
        
        if let str = objects.first {
//            intValue = str.toInt()
            return true
        }
        return false
        
    }
    
    @IBAction func cut(sender: AnyObject?) {
        writeToPasteboard(NSPasteboard.general())
        intValue = nil
    }
    @IBAction func copy(sender: AnyObject?) {
        writeToPasteboard(NSPasteboard.general())
    }
    @IBAction func paste(sender: AnyObject?) {
        readFromPasteboard(NSPasteboard.general())
    }
    
    func draggingSession(_ session: NSDraggingSession, sourceOperationMaskFor context: NSDraggingContext) -> NSDragOperation {
        return NSDragOperation.copy
    }

}
