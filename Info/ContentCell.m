//
//  ContentCell.m
//  Info
//
//  Created by 张玺 on 13-3-26.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import "ContentCell.h"
#import "WebViewController.h"
#import "AppDelegate.h"

@implementation ContentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.backgroundColor = [UIColor redColor];
        
        UIView *titleLine = [[UIView alloc] initWithFrame:CGRectMake(20, 20,5, 36)];
        titleLine.backgroundColor = kBlue;
        [self addSubview:titleLine];
        
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 600, 36)];
        titleLabel.font = [UIFont systemFontOfSize:26];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:titleLabel];
        
        contentView = [[FTCoreTextView alloc] initWithFrame:CGRectMake(20, 80,kContent_Width-40,kContent_Height-100)];
        contentView.delegate = self;
        [contentView addStyles:[self coreTextStyle]];
        [self addSubview:contentView];


    }
    return self;
}
-(void)configWithData:(NSDictionary *)data
{
    titleLabel.text  = data[@"title"];

    NSString *path = [[NSBundle mainBundle] pathForResource:data[@"content"] ofType:@""];
    if(path)
    contentView.text = [[NSString alloc] initWithContentsOfFile:path
                                                       encoding:NSUTF8StringEncoding
                                                          error:nil];
    else
        contentView.text = @" ";
    
}
- (NSArray *)coreTextStyle
{
    NSMutableArray *result = [NSMutableArray array];
    
	FTCoreTextStyle *defaultStyle = [FTCoreTextStyle new];
	defaultStyle.name = FTCoreTextTagDefault;
	defaultStyle.font = [UIFont fontWithName:@"Heiti TC" size:20.0f];
	defaultStyle.textAlignment = FTCoreTextAlignementJustified;
    defaultStyle.minLineHeight = 25;
	[result addObject:defaultStyle];
    
    
    FTCoreTextStyle *linkStyle = [defaultStyle copy];
    linkStyle.name = FTCoreTextTagLink;
    linkStyle.color = [UIColor orangeColor];
    [result addObject:linkStyle];
    
    
    
    FTCoreTextStyle *imageStyle = [FTCoreTextStyle new];
    imageStyle.paragraphInset = UIEdgeInsetsMake(0,0,0,0);
    imageStyle.name = FTCoreTextTagImage;
    imageStyle.textAlignment = FTCoreTextAlignementCenter;
    [result addObject:imageStyle];
    
    
    /*
     FTCoreTextStyle *titleStyle = [FTCoreTextStyle styleWithName:@"title"]; // using fast method
     titleStyle.font = [UIFont fontWithName:@"TimesNewRomanPSMT" size:40.f];
     titleStyle.paragraphInset = UIEdgeInsetsMake(0, 0, 25, 0);
     titleStyle.textAlignment = FTCoreTextAlignementCenter;
     [result addObject:titleStyle];
     
     FTCoreTextStyle *imageStyle = [FTCoreTextStyle new];
     imageStyle.paragraphInset = UIEdgeInsetsMake(0,0,0,0);
     imageStyle.name = FTCoreTextTagImage;
     imageStyle.textAlignment = FTCoreTextAlignementCenter;
     [result addObject:imageStyle];
     
     FTCoreTextStyle *firstLetterStyle = [FTCoreTextStyle new];
     firstLetterStyle.name = @"firstLetter";
     firstLetterStyle.font = [UIFont fontWithName:@"TimesNewRomanPS-BoldMT" size:30.f];
     [result addObject:firstLetterStyle];
     
     FTCoreTextStyle *linkStyle = [defaultStyle copy];
     linkStyle.name = FTCoreTextTagLink;
     linkStyle.color = [UIColor orangeColor];
     [result addObject:linkStyle];
     
     FTCoreTextStyle *subtitleStyle = [FTCoreTextStyle styleWithName:@"subtitle"];
     subtitleStyle.font = [UIFont fontWithName:@"TimesNewRomanPS-BoldMT" size:25.f];
     subtitleStyle.color = [UIColor brownColor];
     subtitleStyle.paragraphInset = UIEdgeInsetsMake(10, 0, 10, 0);
     [result addObject:subtitleStyle];
     
     FTCoreTextStyle *bulletStyle = [defaultStyle copy];
     bulletStyle.name = FTCoreTextTagBullet;
     bulletStyle.bulletFont = [UIFont fontWithName:@"TimesNewRomanPSMT" size:16.f];
     bulletStyle.bulletColor = [UIColor orangeColor];
     bulletStyle.bulletCharacter = @"❧";
     [result addObject:bulletStyle];
     */
    
    return result;
}
- (void)coreTextView:(FTCoreTextView *)acoreTextView receivedTouchOnData:(NSDictionary *)data
{
    NSLog(@"%@",data);
    NSURL *url = [data objectForKey:FTCoreTextDataURL];
    
    if(url)
    {
        AppDelegate *app = kApp;
        WebViewController *web = [[WebViewController alloc] initWithURL:url];
        [app.navigationController pushViewController:web animated:YES];
    }
    
    
    //if (!url) return;
    //[[UIApplication sharedApplication] openURL:url];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSString *)reuseIdentifier
{
    return @"ContentCell";
}

@end
