//
//  CalendarDayCell.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/8/3.
//  Copyright (c) 2015年 zzp. All rights reserved.
//

import Cocoa

class DayItem : NSCollectionViewItem {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    override var selected: Bool {
        didSet {
            if selected{
            print(representedObject)
            }
        }
    }
    
    override func rightMouseDown(theEvent: NSEvent) {
//        if !selected{
//            print(self)
//            selected = true
//        }
    }
    
}
