//
//  Calendar.swift
//  ResponsiveCalendar
//
//  Created by zzp on 15/7/28.
//  Copyright (c) 2015年 zzp. All rights reserved.
//

import Foundation

class Calendar {
//    var currentMonth: [Date]? {
//        
//    }
    
    private static var instance: Calendar?
    let numberOfDaysInPage = 42
    
//    var firstDayOfMonth: Date{
//        let calendar = NSCalendar.currentCalendar()
//        var components = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: baseDate)
//        components.day = 1
//        var date = calendar.dateFromComponents(components)
//        return Date(date: date!)
//    }
    
//    var lastDayOfMonth: Date{
//        println("base date:\(baseDate)")
//        let calendar = NSCalendar.currentCalendar()
//        var components = calendar.components(.CalendarUnitYear | .CalendarUnitMonth, fromDate: baseDate)
//        components.month += 1
//        components.day = 0
//        var date = calendar.dateFromComponents(components)
//        return Date(date: date!)
//    }
//  
    class func sharedCalendar() -> Calendar{
        if instance == nil {
            instance = Calendar()
        }
        return instance!
    }
    
    var baseDate: NSDate{
        didSet{
            print("didset to do")
            days = getDays()
//            pageDays = getPageDays()
        }
    }
    
    convenience init(){
        self.init(date: NSDate())
    }
    init(date: NSDate){
        baseDate = date
        days = getDays()
    }
    var days: [Date]!
    func getDays() -> [Date]{
        var dates: [Date] = []
        
        let calendar = NSCalendar.currentCalendar()
        var components = calendar.components([.Year, .Month, .Day], fromDate: baseDate)
        components.day = 1
        let firstDayOfMonth = Date(date: calendar.dateFromComponents(components)!)
        
        components = calendar.components([.Year, .Month], fromDate: baseDate)
        components.month += 1
        components.day = 0
        let lastDayOfMonth = Date(date: calendar.dateFromComponents(components)!)
        
        var numberOfLeadingDays = firstDayOfMonth.weekday - 1
        let numberOfTailingDays = numberOfDaysInPage - lastDayOfMonth.day - numberOfLeadingDays
        
        if numberOfLeadingDays > 0{
            let components = NSDateComponents()
            components.day = 0
            components.month = firstDayOfMonth.month
            components.year = firstDayOfMonth.year
            let lastDayOfPreviousMonth = Date(date: calendar.dateFromComponents(components)!)
            while --numberOfLeadingDays >= 0{
                dates.append(Date(day: lastDayOfPreviousMonth.day - numberOfLeadingDays, month: lastDayOfPreviousMonth.month, year: lastDayOfPreviousMonth.year))
            }
        }
        for day in firstDayOfMonth.day...lastDayOfMonth.day{
            let d = Date(day: day, month: firstDayOfMonth.month, year: firstDayOfMonth.year)
//            print(d)
            dates.append(d)
        }
        
        let firstDayOfNextMonth = Date(date: calendar.dateByAddingUnit(.Day, value: 1, toDate: lastDayOfMonth.toNSDate()!, options: [])!)
        print(firstDayOfNextMonth)
        
        for day in 1...numberOfTailingDays{
            dates.append(Date(day: day, month: firstDayOfNextMonth.month, year: firstDayOfNextMonth.year))
        }
        print(dates)
        return dates
    }
    
    func previousMonth() {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: baseDate)
        components.day = 1
        components.month -= 1
        baseDate = calendar.dateFromComponents(components)!
    }
    
    func nextMonth() {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: baseDate)
        components.day = 1
        components.month += 1
        baseDate = calendar.dateFromComponents(components)!
    }
    
    
    
}