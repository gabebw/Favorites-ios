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
}

@end