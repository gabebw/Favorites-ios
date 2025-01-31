//
//  FAVMasterViewController.m
//  Favorites
//
//  Created by Gabe Berke-Williams on 9/4/14.
//  Copyright (c) 2014 Gabe Berke-Williams. All rights reserved.
//

#import "FAVMasterViewController.h"
#import "FAVDetailViewController.h"
#import "FAVFavoriteItem.h"

// empty parentheses make it a "class extension", which lets us define
// properties available only within this class
@interface FAVMasterViewController ()
    // Internal mutable array (NSArray is not mutable)
    @property (strong, nonatomic) NSMutableArray *favorites;
@end

@implementation FAVMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create array of editable items
    // Note that we're not doing alloc-init
    self.favorites = [NSMutableArray array];

    // @selector gives you a reference to a method
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
 
    // Put the "add" button on the right
    self.navigationItem.rightBarButtonItem = addButton;
}

// Reload all the data when the list is shown
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)addItem:(id)sender {
    FAVFavoriteItem *newItem = [[FAVFavoriteItem alloc] init];
    newItem.name = @"Cool name";
    newItem.reason = @"Just because";

    // Insert item into array...
    [self.favorites insertObject:newItem atIndex:0];

    // ...and tell the tableview about it
    NSIndexPath *rowZero = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[rowZero] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// method name is tableView, takes 2 parameters:
// (UITableView *)tableView
// (NSInteger)section
// to call it:
//
// rowCount = [thingy tableView:self numberOfRowsInSection:6]
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (NSInteger)[self.favorites count];
}

// This method is called when iOS needs to populate a specific table cell
// with content
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    // Grab a specific favorite
    FAVFavoriteItem *favorite = self.favorites[row];

    // Makes cells the first 10 or 12 times, then reuses them every time after that
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StandardCell" forIndexPath:indexPath];
    // Set cell contents
    cell.textLabel.text = [favorite name];
    // Set cell subtitle
    cell.detailTextLabel.text = [favorite reason];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Show favorite as detailItem in detail view
    if ([segue.identifier isEqualToString:@"ChosenItemShowsDetail"] ) {
        // User just tapped on an item row and we're about to go into the detail view
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        id favorite = self.favorites[path.row];
        FAVDetailViewController *detail = segue.destinationViewController;
        detail.detailItem = favorite;
    }
}
@end
