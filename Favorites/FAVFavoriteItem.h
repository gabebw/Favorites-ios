//
//  FAVFavoriteItem.h
//  Favorites
//
//  Created by Gabe Berke-Williams on 9/11/14.
//  Copyright (c) 2014 Gabe Berke-Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAVFavoriteItem : NSObject

@property (copy, nonatomic) NSString *name;
// "description" is built-in to a lot of objects so we won't use it here;
// instead we'll use "reason"
@property (copy, nonatomic) NSString *reason;

@end
