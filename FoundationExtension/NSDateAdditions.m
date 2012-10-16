//
//  NSDateAdditions.m
//  FoundationExtension
//
//  Created by youknowone on 11. 7. 27..
//  Copyright 2011 youknowone.org All rights reserved.
//

#import "NSDateAdditions.h"

@implementation NSDate (FoundationExtension)

- (NSDateComponents *)components {
    return [[NSCalendar currentCalendar] components:NSEraCalendarUnit
            | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
            | NSHourCalendarUnit | NSMinuteCalendarUnit| NSSecondCalendarUnit
            | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit
            | NSQuarterCalendarUnit //| NSCalendarCalendarUnit | NSTimeZoneCalendarUnit
                                           fromDate:self];
}

@end
