//
//  NSNumber.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 3. 10..
//  Copyright (c) 2013 youknowone.org All rights reserved.
//

/*!
 *  @file
 *  @brief [NSNumber][0] and [NSDecimalNumber][1] extension category collection.
 *      [0]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSNumber_Class/Reference/Reference.html
 *      [1]: https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSDecimalNumber_Class/Reference/Reference.html
 */

/*!
 *  @brief NSNumber description method extension
 */
@interface NSNumber (Description)

/*
 *  @brief Returns a string that describes the value of the number. This keeps type information.
 *  @return A string that describes the value of the number.
 */
- (NSString *)typeFormedDescription;

@end


/*!
 *  @brief NSNumber description method extension
 */
@interface NSDecimalNumber (Description)

/*
 *  @brief Returns a string that describes the value of the number. This keeps type information.
 *  @return A string that describes the value of the number.
 */
- (NSString *)typeFormedDescription;

@end
