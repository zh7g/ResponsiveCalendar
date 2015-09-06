//
//  CalendarCollectionView.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/8/13.
//  Copyright © 2015年 zzp. All rights reserved.
//

import Cocoa

class CalendarCollectionView: NSCollectionView{
    
    override func viewWillDraw() {
        super.viewWillDraw()
        fixItemSize()
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
    
    //    @IBInspectable var hasContextMenu: Bool = false
    //    @IBOutlet weak var collectionViewMenu: NSMenu!
    //    override func menuForEvent(event: NSEvent) -> NSMenu? {
    //        if hasContextMenu{
    //            if event.type == .RightMouseDown{
    //                return  collectionViewMenu
    //            }
    //        }
    //        return nil
    //    }
    
}
