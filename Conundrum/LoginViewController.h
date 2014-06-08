//
//  LoginViewController.h
//  Conundrum
//
//  Created by Le, Huy on 6/7/14.
//  Copyright (c) 2014 BUILDS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtUrl;
@property (strong, nonatomic) IBOutlet UITextView *txtOutput;

- (IBAction)clickedRequestCall:(id)sender;

@end
