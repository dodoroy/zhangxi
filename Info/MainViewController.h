//
//  ViewController.h
//  Info
//
//  Created by 张 玺 on 13-3-26.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageNumberView.h"

@interface MainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    PageNumberView *pageNumber;
    NSArray *localData;
}
@property (weak, nonatomic) IBOutlet UITableView *table;
@end
