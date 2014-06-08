//
//  GenerateD3ViewController.m
//  Conundrum
//
//  Created by Le, Huy on 6/7/14.
//  Copyright (c) 2014 BUILDS. All rights reserved.
//

#import "GenerateD3ViewController.h"

@interface GenerateD3ViewController ()

@end

@implementation GenerateD3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *myURL = [NSURL URLWithString:@"file:///Users/hle2/Documents/D3/d3.html"];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
    
    [myWebView loadRequest:myRequest];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
