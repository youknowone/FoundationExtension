//
//  UITMasterViewController.m
//  UIKitExtensionTestApp
//
//  Created by Jeong YunWon on 12. 10. 24..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "UITMasterViewController.h"

#import "UITDetailViewController.h"

@interface UITMasterViewController () {
    NSArray *_details;
}
@end

@implementation UITMasterViewController

- (void)timerFired:(NSTimer *)timer {
    self.title = [[NSDate date] description];
}

- (BOOL)timerShouldRepeat:(NSTimer *)timer {
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}
							
- (void)dealloc
{
    [_details release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(changeTitle:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;

    // #TEST: NSTimerDelegate
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1.0 delegate:self];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

    _details = [@[
                @"Detail",
                @"ResultDisplay",
                @"PreparedCellTable",
                @"PlaceholderText",
                @"SubviewTable",
                ] retain];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeTitle:(id)sender
{
    self.title = @"TEST!";
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_details count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UIATableViewCellCopyable alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }

    UIImage *originalImage = [UIImage imageNamed:@"Default.png"];
    // TEST: UIImage -imageByResizingToSize:
    UIImage *bulletImage = [originalImage imageByResizingToSize:CGSizeMake(15.0, 20.0)];
    cell.imageView.image = bulletImage;

    cell.textLabel.text = [_details :indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *detailName = [_details:indexPath.row];
    NSString *className = [@"UIT%@ViewController" format:detailName];
    Class class = NSClassFromString(className);
    UIViewController *detailViewController = [class alloc];
    @try {
        NSString *name = [@"UIT%@ViewController" format:detailName];
        [detailViewController initWithNibName:name bundle:nil];
        [detailViewController view]; // force load
    }
    @catch (NSException *exception) {
        NSLog(@"errer met: %@ / retry", exception);
        NSString *name = [@"UIT%@ViewController" format:detailName];
        [detailViewController initWithPlatformSuffixedNibName:name bundle:nil];
    }
    @finally {

    }

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self.navigationController pushViewController:detailViewController animated:YES];
    } else {
        UISplitViewController *splitViewController = (UISplitViewController *)self.view.window.rootViewController;
        UINavigationController *detailNavigationController = [splitViewController.viewControllers:1];
        [detailNavigationController popToRootViewControllerAnimated:NO];
        [detailNavigationController pushViewController:detailViewController animated:NO];
    }
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

@end
