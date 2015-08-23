//
//  ViewController.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/7/26.
//  Copyright (c) 2015年 zzp. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var placeHolder: NSView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let calendarView = ResponsiveCalendarView.instance()
        //        var calendarView = ResponsiveCalendarView()
        
        placeHolder.addSubview(calendarView!)
//        placeHolder.translatesAutoresizingMaskIntoConstraints = false
//
//        let constraints = NSLayoutConstraint.constraintsWithVisualFormat("|-10-[calendarView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["calendarView": calendarView!])
//        let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[calendarView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["calendarView": calendarView!])
//
//        placeHolder.addConstraints(constraints)
//        placeHolder.addConstraints(vConstraints)
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

