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
        fixItemSize()
    }
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
    
    override func viewDidEndLiveResize() {
        fixItemSize()
    }
    
     func fixItemSize(){
        let w = (self.bounds.width - 1) / 7
        let h = self.bounds.height / 6
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
