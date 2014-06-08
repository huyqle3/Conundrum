//
//  LoginViewController.m
//  Conundrum
//
//  Created by Le, Huy on 6/7/14.
//  Copyright (c) 2014 BUILDS. All rights reserved.
//

#import "LoginViewController.h"
#import "ASIHTTPRequest.h"
#import "HTTPRequest.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize txtUrl, txtOutput;

#define REQUEST_HTTP_CALL   1

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
    /* NSURL *url = [NSURL URLWithString:@"https://api.enigma.io/v2/data/7e71e4a8bd76ae27cf2bb78eba581dcb/us.gov.whitehouse.visitor-list/search/john/select/namefull,appt_made_date/limit/20/"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDownloadDestinationPath:@"/Users/hle2/Desktop/my_file.txt"]; */

    [super viewDidLoad];
     self.txtUrl.delegate = self;
    // Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedRequestCall:(id)sender{
    // URL String from Text Box
    NSString *url = txtUrl.text;
    
    // Craete HttpRequset instance.
    HTTPRequest *httpRequest = [[HTTPRequest alloc] init];
    
    // You need to set up a tag if you call different requests.
    // Different requests are distinguished by a tag
    httpRequest.tag = REQUEST_HTTP_CALL;
    
    // Set up for a content type.
    httpRequest.contentType = @"application/json;";
    
    // A body message is required when you call a request with Post method.
    NSString *body = [NSString stringWithFormat:@""];
    
    // The following delegate will be called by the request instance when the http call is finished.
    [httpRequest setDelegate:self selector:@selector(didReceiveFinished:)];
    
    // Error delegate will be called when there is a error.
    // If you don't mind whether there is a error or not, just set it nil.
    [httpRequest setErrorDelegate:self selector:nil];
    
    // Finally!
    [httpRequest requestUrl:url bodyString:body sendMethod:GET_METHOD];
}

- (void)didReceiveFinished:(NSArray*) objects {
    // objects[0] = HTTPRequest instance
    HTTPRequest* request = (HTTPRequest*) [objects objectAtIndex:0];
    
    // objects[1] = returned string
    NSString* returnString = (NSString*) [objects objectAtIndex:1];
    
    // A request can be distinguished by a tag number.
    if (request.tag == REQUEST_HTTP_CALL) {
        txtOutput.text = returnString;
    }
}

/* - (IBAction)grabURL:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        //NSString *response = [request responseString];
    }
} */

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
