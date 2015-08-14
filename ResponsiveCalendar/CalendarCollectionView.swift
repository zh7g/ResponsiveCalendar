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
        fixItemSize()
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
//    override func viewDidEndLiveResize() {
//        Swift.print("test.....")
//        let widthFactor = superview!.superview!.frame.width / oldSizeOfSuperView!.width
//        let heightFactor = superview!.superview!.frame.height / oldSizeOfSuperView!.height
//        self.frame.size = NSMakeSize(oldSize!.width * widthFactor, oldSize!.height * heightFactor)
//        fixItemSize()
////        self.needsDisplay = true
//    }
    
     func fixItemSize(){
        let w = self.bounds.width / 7
        let h = self.bounds.height / 6
        self.minItemSize = NSMakeSize(w, h)
        self.maxItemSize = NSMakeSize(w, h)
    }
}
