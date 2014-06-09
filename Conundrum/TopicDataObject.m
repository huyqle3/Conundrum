//
//  TopicDataObject.m
//  Conundrum
//
//  Created by Winston Chen on 6/8/14.
//  Copyright (c) 2014 BUILDS. All rights reserved.
//

#import "TopicDataObject.h"

@implementation TopicDataObject


- (id)initWithName:(NSString *)name children:(NSArray *)children
{
    self = [super init];
    if (self) {
        self.children = children;
        self.name = name;
    }
    
    /*
    MyAppDelegate *appDelegate = (MyAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.navigationController presentViewController:myNewViewController animated:YES completion:nil];
     */
    return self;
}

+ (id)dataObjectWithName:(NSString *)name children:(NSArray *)children
{
    return [[self alloc] initWithName:name children:children];
}



@end
