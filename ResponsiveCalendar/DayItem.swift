//
//  CalendarDayCell.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/8/3.
//  Copyright (c) 2015年 zzp. All rights reserved.
//

import Cocoa

class DayItem : NSCollectionViewItem {
    
//
//    required init?(coder: NSCoder) {
//        super.init(coder:coder)
//        days = Calendar.sharedCalendar().getDays()
//    }
//    override func awakeFromNib() {
//        var superBounds = self.collectionView.bounds
//        let width = superBounds.width/7
//        let height = superBounds.height/6
//        print(width)
//        print(height)
//        self.view.setFrameSize(NSMakeSize(width, height))
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.needsDisplay = true
        // Do view setup here.
//        var superBounds = self.collectionView.bounds
//        let width = superBounds.width/7
//        let height = superBounds.height/6
//        self.view.frame.size = NSMakeSize(width, height)
    }
    
    
}
