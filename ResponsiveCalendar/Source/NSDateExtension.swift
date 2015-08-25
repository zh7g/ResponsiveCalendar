//
//  NSDateExtension.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/8/3.
//  Copyright (c) 2015年 zzp. All rights reserved.
//

import Foundation

extension NSDate{
    func day() -> Int{
        return components.day
    }
    
    func month() -> Int{
        return components.month
    }
    
    func year() -> Int{
        return components.year
    }
    
    func weekday() -> Int{
        return components.weekday
    }
    
    private var components: NSDateComponents{
        return NSCalendar.currentCalendar().components(NSCalendarUnit(rawValue: UInt.max), fromDate: self)
    }
}