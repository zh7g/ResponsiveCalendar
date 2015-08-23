//
//  CalendarCollectionView.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/8/13.
//  Copyright © 2015年 zzp. All rights reserved.
//

import Cocoa

class CalendarCollectionView: NSCollectionView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        let w = self.bounds.width / 7
//        let h = self.bounds.height / 6
//        self.minItemSize = NSMakeSize(w, h)
//        self.maxItemSize = NSMakeSize(w, h)
        fixItemSize()
    }
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        // Drawing code here.
        Swift.print("test...")
//        fixItemSize()
    }
    
//    var oldSizeOfSuperView: NSSize?
//    var oldSize: NSSize?
//    override func viewWillStartLiveResize() {
//        oldSizeOfSuperView = superview!.superview!.frame.size
//        oldSize = self.frame.size
//        Swift.print(oldSizeOfSuperView)
//        Swift.print(oldSize)
//        
//    }
//    
//    
    override func viewDidEndLiveResize() {
        fixItemSize()
    }
    
     func fixItemSize(){
        let w = self.bounds.width / 7 - 1
        let h = self.bounds.height / 6 - 1
        self.minItemSize = NSMakeSize(w, h)
        self.maxItemSize = NSMakeSize(w, h)
    }
    
//    override func rightMouseDown(theEvent: NSEvent) {
//        print("test")
////        return super.rightMouseDown(theEvent)
//    }
//    override func newItemForRepresentedObject(object: AnyObject) -> NSCollectionViewItem {
//        var item = object.item
//        if item == nil{
//            item = super.newItemForRepresentedObject(object)
//            o
//        }
//    }
    
    
}
