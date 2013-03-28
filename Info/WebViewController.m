//
//  WebViewController.m
//  Info
//
//  Created by 张 玺 on 13-3-27.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import "WebViewController.h"



@implementation WebViewController

-(id)initWithURLString:(NSString *)urlString
{
    self = [super initWithNibName:@"WebViewController" bundle:nil];
    if (self) {
        self.url = [NSURL URLWithString:urlString];
    }
    return self;
}
-(id)initWithURL:(NSURL *)theURL
{
    self = [super initWithNibName:@"WebViewController" bundle:nil];
    if (self) {
        self.url = theURL;
    }
    return self;
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.web loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWeb:nil];
    [super viewDidUnload];
}
@end
