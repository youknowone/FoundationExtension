//
//  UIAPreparedCellTableView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 4. 7..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @brief A table view using rrepared cells instead of data source.
 *  @details Cells are prepared cells for self-implemented data source protocol.
 *      Cells can be grouped by section or not.
 *      It is decided by hasUniqueSection.
 *      The table view does not reuse any cells by reuse identifier.
 */
@interface UIAPreparedCellTableView : UITableView<UITableViewDataSource>

/*!
 *  @brief The flag tells cells are sectioned or not.
 *  @details YES if Cells are not sectioned; otherwise NO;
 */
@property(nonatomic, assign, getter=hasUniqueSection) BOOL hasUniqueSection;
/*!
 *  @brief The array of cells or array of arrays of cells to be used.
 *  @details Array of cells if hasUniqueSection is YES; otherwise Array of arrays of cells.
 */
@property(nonatomic, retain) NSArray *cells; // should be array of array

@end
