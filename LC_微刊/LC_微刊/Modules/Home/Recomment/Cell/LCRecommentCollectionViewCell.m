//
//  LCRecommentCollectionViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCRecommentCollectionViewCell.h"
#import "LCMacro.h"
#import "LCSubRecommentOneTableViewCell.h"
#import "LCSubRecommentTwoTableViewCell.h"
#import "LCSubRecommentTypeThreeTableViewCell.h"
#import "News.h"
#import "UIImageView+WebCache.h"
#import "LCRecommendNewsViewController.h"


static NSString *const recommentCell = @"cell";

@interface LCRecommentCollectionViewCell ()

<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong)NSMutableArray *newsArray;

@property (nonatomic, strong)UITableView *recommentTableView;

@property (nonatomic, copy)NSString *ima_status;

@end

@implementation LCRecommentCollectionViewCell

#pragma mark - 推荐页布局
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.recommentTableView = [[UITableView alloc] initWithFrame:self.bounds];
        _recommentTableView.dataSource = self;
        _recommentTableView.delegate = self;
        _recommentTableView.rowHeight = 145.f;
        [self addSubview:_recommentTableView];
        
        [_recommentTableView registerClass:[LCSubRecommentOneTableViewCell class] forCellReuseIdentifier:recommentCell];
        
      
        [self getDataFromJson];

        
    }
          return self;

}


#pragma mark - 网络请求
- (void)getDataFromJson {
   
    NSString *string = @"http://c.m.163.com/nc/article/list/T1348648517839/0-20.html";
    
    [BHNetTool GET:string Body:nil HeaderFile:nil Response:BHJSON Success:^(id result) {
        
        //        NSLog(@"%@", result);
        
        self.newsArray = [NSMutableArray array];
        
        NSArray *datasArray = [result objectForKey:@"T1348648517839"];
        
        for (NSDictionary *titleDic in datasArray) {
            News *title = [News newsWithTitleDic:titleDic];
            [_newsArray addObject:title];
        }
        
        [_recommentTableView reloadData];
        //        NSLog(@"%ld", _newsArray.count);
    } Failure:^(NSError *error) {
        
    }];
    
    
}

#pragma mark - tableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _newsArray.count - 1;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCSubRecommentOneTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:recommentCell];
    
    News *news = _newsArray[indexPath.row + 1];
    NSString *imageURL = news.imgsrc;
    [newsCell.recommentTypeOneImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    
    newsCell.recommentTypeOneLabel.text = news.title;
    newsCell.authorText = news.source;
    
    return newsCell;
    
}



#pragma mark - 当前控制器的导航控制器
- (UINavigationController *)naviController {
    
    for (UIView *next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController*)nextResponder;
        }
    }
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LCRecommendNewsViewController *recommendVC = [[LCRecommendNewsViewController alloc] init];
    News *news = _newsArray[indexPath.row + 1];
    recommendVC.url = news.url;

    recommendVC.hidesBottomBarWhenPushed = YES;

   
    [[self naviController] pushViewController:recommendVC animated:YES];

    
    

}

@end
