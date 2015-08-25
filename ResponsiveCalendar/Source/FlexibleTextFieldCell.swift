//
//  FlexibleTextField.swift
//  FlexibleTextField
//
//  Created by zzp on 15/8/10.
//  Copyright © 2015年 zzp. All rights reserved.
//

import Cocoa


@IBDesignable
class FlexibleTextFieldCell: NSTextFieldCell {
    
    @IBInspectable var alignVerticalCenter: Bool = true
    
    override func drawInteriorWithFrame(cellFrame: NSRect, inView controlView: NSView) {
        if drawsBackground && backgroundColor != nil && backgroundColor!.alphaComponent > 0{
            backgroundColor!.set()
            NSRectFill(cellFrame)
        }
        attributedStringValue.drawWithRect(titleRectForBounds(cellFrame), options: [ .TruncatesLastVisibleLine, .UsesLineFragmentOrigin])
    }
    
    override func titleRectForBounds(theRect: NSRect) -> NSRect {
        var titleFrame = super.titleRectForBounds(theRect)
        if alignVerticalCenter{
            let textRect = attributedStringValue.boundingRectWithSize(titleFrame.size, options:[ NSStringDrawingOptions.TruncatesLastVisibleLine, NSStringDrawingOptions.UsesLineFragmentOrigin])
            
            if textRect.size.height < titleFrame.size.height{
                titleFrame.origin.y = theRect.origin.y + (theRect.size.height - textRect.size.height)/2.0
                titleFrame.size.height = textRect.size.height
            }
        }
        return titleFrame
    }
    
}
