//
//  NSDate.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 11. 7. 27..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "NSDate.h"

@implementation NSDate (Shortcuts)

- (NSDateComponents *)components {
    return [[NSCalendar currentCalendar] components:NSEraCalendarUnit
            | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
            | NSHourCalendarUnit | NSMinuteCalendarUnit| NSSecondCalendarUnit
            | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit
            | NSQuarterCalendarUnit //| NSCalendarCalendarUnit | NSTimeZoneCalendarUnit
                                           fromDate:self];
}

@end
