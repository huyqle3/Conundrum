//
//  TopicDataObject.h
//  Conundrum
//
//  Created by Winston Chen on 6/8/14.
//  Copyright (c) 2014 BUILDS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicDataObject : NSObject


@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *children;
@property (strong, nonatomic) UIViewController *obj;

- (id)initWithName:(NSString *)name children:(NSArray *)array;

+ (id)dataObjectWithName:(NSString *)name children:(NSArray *)children;

@end
