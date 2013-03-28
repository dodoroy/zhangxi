//
//  ViewController.m
//  Info
//
//  Created by 张 玺 on 13-3-26.
//  Copyright (c) 2013年 me.zhangxi. All rights reserved.
//

#import "MainViewController.h"
#import "ContentCell.h"


@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ContentList" ofType:@"plist"];
    localData = [[NSArray alloc] initWithContentsOfFile:path];
    
    pageNumber = [[PageNumberView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    pageNumber.value =1;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tap)];
    [pageNumber addGestureRecognizer:tap];
    
    pageNumber.center = self.view.center;
    
    pageNumber.titleLabel.text = @"张玺";

    
    [self.view addSubview:pageNumber];
    self.table.hidden = YES;
}

-(void)tap
{
    void(^move)() = ^{
        pageNumber.frame = CGRectMake(650, 20, 100, 100);
        [pageNumber setNeedsDisplay];
    };
    
    void(^load)(BOOL)  = ^(BOOL finished){
        self.table.hidden = NO;
    };
    
    [UIView animateWithDuration:0.3
                     animations:move
                     completion:load];
}

#pragma -mark ScrollView Delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    pageNumber.value = (float)((int)scrollView.contentOffset.y%(int)kContent_Height)/kContent_Height;
    
    
    pageNumber.titleLabel.text = [NSString stringWithFormat:@"%d/%d",
                                  (int)(scrollView.contentOffset.y/scrollView.frame.size.height)+1,
                                  localData.count];
}
#pragma -mark TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return localData.count;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kContent_Height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ContentCell";
    
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell configWithData:localData[indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [self setTable:nil];
    [super viewDidUnload];
}
@end
