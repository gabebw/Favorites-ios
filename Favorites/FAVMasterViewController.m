//
//  FAVMasterViewController.m
//  Favorites
//
//  Created by Gabe Berke-Williams on 9/4/14.
//  Copyright (c) 2014 Gabe Berke-Williams. All rights reserved.
//

#import "FAVMasterViewController.h"

#import "FAVDetailViewController.h"

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

    // Create inline mutable array
    self.favorites = [@[@"HELLO", @"HI", @"THERE"] mutableCopy];
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
    // Grab a specific favorite (`id` is a type that can be a pointer to anything)

    // Old:
    //id favorite = [self.favorites objectAtIndex:row];
    // New hotness:
    id favorite = self.favorites[row];

    // Makes cells the first 10 or 12 times, then reuses them every time after that
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StandardCell" forIndexPath:indexPath];
    // Set cell contents
    cell.textLabel.text = [favorite description];

    return cell;
}
@end
