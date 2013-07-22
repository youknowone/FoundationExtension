//
//  UIASubviewTableView.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 5. 11..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIASubviewTableSubviewSource;

/*!
 *  @brief Table view for various sized cell fit for subviews.
 *  @details This table view is designed to support various-sized cell for view source.
 *      dataSource is implemented internally. Implement subviewSource indtead of it.
 */
@interface UIASubviewTableView : UITableView<UITableViewDataSource, UITableViewDelegate> {
    id _dataSourceImpl;
    id _delegateMediator;
    struct {
        BOOL subviewSourceViewHeightForRow: 1;
    } _subviewTableViewFlags;
}

/*!
 *  @brief The table view's subview source.
 */
@property(nonatomic, assign) IBOutlet id<UIASubviewTableSubviewSource> subviewSource;

@end


/*!
 *  @brief This protocol defines data source and subview source methods for UIASubviewTableView objects.
 *  @details This covers optional methods of data source, because table view self-implemented its required methods.
 */
@protocol UIASubviewTableSubviewSource <NSObject>

/*!
 *  @brief Asks the subview source the number of subviews.
 */
- (NSUInteger)subviewTableViewNumberOfSubviews:(UIASubviewTableView *)scrollView;

/*!
 *  @brief Asks the subview source the view for given row.
 */
- (UIView *)subviewTableView:(UIASubviewTableView *)scrollView viewForRow:(NSUInteger)row;

@optional

/*!
 *  @brief Asks the subview source the height of view for given row.
 *  @details This is used to avoid referencing real view for row to calculate height for the row. If not implemented, default value is view.frame.size.height for each view.
 *  @warning This doesn't work if you implement tableView:heightForRowAtIndexPath:.
 */
- (CGFloat)subviewTableView:(UIASubviewTableView *)scrollView viewHeightForRow:(NSUInteger)row;

@optional // copy of UITableViewDataSource optional

/*!
 *  @name Forwardings
 */

/*!
 *  @brief Forwarding method for UITableViewDataSource
 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
/*!
 *  @brief Forwarding method for UITableViewDataSource
 */
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
/*!
 *  @brief Forwarding method for UITableViewDataSource
 */
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;
/*!
 *  @brief Forwarding method for UITableViewDataSource
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
/*!
 *  @brief Forwarding method for UITableViewDataSource
 */
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

@end
