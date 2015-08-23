//
//  ResponsiveCalendarView.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/7/26.
//  Copyright (c) 2015年 zzp. All rights reserved.
//

import Cocoa

class ResponsiveCalendarView: NSView {
    private var calendar = Calendar.sharedCalendar()
    //    var days = Calendar.sharedCalendar().getDays()
    @IBOutlet weak var monthLabel: NSTextField!
    @IBOutlet weak var arrayController: NSArrayController!
    @IBOutlet weak var collectionView: CalendarCollectionView!
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        // Drawing code here.
        NSColor.whiteColor().setFill()
        NSRectFill(dirtyRect)
    }
    
    override func awakeFromNib() {
        //        Calendar.sharedCalendar()
        arrayController.content = calendar.days
        
        monthLabel.stringValue = "\(calendar.baseDate.year())年\(calendar.baseDate.month())月"
        //        collectionView.content = calendar.days
        self.autoresizingMask = [ .ViewWidthSizable, .ViewHeightSizable ]
        
    }
    
    class func instance() -> ResponsiveCalendarView?{
        var views: NSArray?
        NSBundle.mainBundle().loadNibNamed("ResponsiveCalendarView", owner: nil, topLevelObjects: &views)
        
        for view in views as! [AnyObject]{
            if view.isKindOfClass(ResponsiveCalendarView){
                return view as? ResponsiveCalendarView
            }
        }
        return nil
    }
    
    
    @IBAction func previousMonth(sender: AnyObject) {
        Swift.print("prev month")
        calendar.previousMonth()
        monthLabel.stringValue = "\(calendar.baseDate.year())年\(calendar.baseDate.month())月"
        arrayController.content = []
        arrayController.content = calendar.days
    }
    
    @IBAction func nextMonth(sender: AnyObject) {
        Swift.print("next month")
        calendar.nextMonth()
        monthLabel.stringValue = "\(calendar.baseDate.year())年\(calendar.baseDate.month())月"
        arrayController.content = []
        arrayController.content = calendar.days
    }


}
