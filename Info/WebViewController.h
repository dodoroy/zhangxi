//
//  WebViewController.h
//  Info
//
//  Created by 张 玺 on 13-3-27.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property(nonatomic,strong) NSURL *url;
@property (weak, nonatomic) IBOutlet UIWebView *web;

-(id)initWithURLString:(NSString *)urlString;
-(id)initWithURL:(NSURL *)theURL;
- (IBAction)back:(id)sender;

@end
