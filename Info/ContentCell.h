//
//  ContentCell.h
//  Info
//
//  Created by 张玺 on 13-3-26.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTCoreTextView.h"

@interface ContentCell : UITableViewCell<FTCoreTextViewDelegate>
{
    UILabel *titleLabel;
    FTCoreTextView *contentView;
}

/*
 
 字典组成:
 
 title    ->  标题
 
 content  ->  富文本内容 https://github.com/FuerteInternational/FTCoreText

 */
-(void)configWithData:(NSDictionary *)data;

@end
