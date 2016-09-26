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
#import "HttpClient.h"
#import "News.h"
#import "UIImageView+WebCache.h"


static NSString *const recommentCell = @"cell";

@interface LCRecommentCollectionViewCell ()

<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong)NSMutableArray *newsArray;

@property (nonatomic, strong)UITableView *recommentTableView;

@property (nonatomic, assign)id result;

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
        _recommentTableView.rowHeight = 120.f;
        [self addSubview:_recommentTableView];
        
        [_recommentTableView registerClass:[LCSubRecommentOneTableViewCell class] forCellReuseIdentifier:recommentCell];
        
      
        [self getDataFromJson];

        
    }
          return self;

}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    NSString *ima_status = [NSString stringWithFormat:@"%@", [_REArticle_list[indexPath] objectForKey:@"img_status"]];
//    if (1 == [_REArticle_list[indexPath] objectForKey:@"img_status"]) {
//        _recommentTableView.rowHeight
//    }
//
//
//}


#pragma mark - 网络请求
- (void)getDataFromJson {
    
//    NSDate *datenow =[NSDate date];//现在时间
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate:datenow];
//    NSDate *localeDate = [datenow  dateByAddingTimeInterval: interval];
//    NSString *timeStamp = [NSString stringWithFormat:@"%ld", (long)[localeDate timeIntervalSince1970]];
//    NSDate *currentTime = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
//    NSLog(@"%@", currentTime);
//
//    
//    NSString *userStr = [NSString stringWithFormat:@"uuid=0869CBB6-D82C-4B7F-BDF9-AF62C4F95FAB&version=19&screenwidth=375.000000&screenheight=667.000000&time=%@&api_version=v2.0.0&lat=38.882700&lng=121.539460&os_version=9.3.2&network=1&os_type=2&carrier=46007", currentTime];
//
//    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
//                                @"Cookie": @"PHPSESSID=tesjd4lu5fqn4lo6usga9d7ic2",
//                                @"Connection": @"keep-alive",
//                                @" X-Device-Info": userStr,
//                                          @"User-Agent": @"vKan/1.9.6 (iPhone; iOS 10.0.1; Scale/2.00)",
//                                          @"Accept-Language": @"zh-Hans-CN;q=1, en-CN;q=0.9, ja-JP;q=0.8",
//                                          @"Token": @"A0UAP9AV5AHCRAHB",
//                                          @"Accept-Encoding": @"gzip, deflate"};
//    
//    NSString *url = @"http://v20.tp.wkread.com/index.php/home/Home";
//    
//    [BHNetTool GET:url Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
//        NSLog(@"%@", result);
//        if (![[result objectForKey:@"info"] isEqualToString:@""]) {
//            self.result = result;
//        }
//        NSLog(@"self.result  : %@",  _result);
    
//        self.REArticle_list = [NSArray array];
//        
//        NSDictionary *dic = (NSDictionary *)result;
//
//        NSDictionary *arrData = [dic objectForKey:@"data"];
//        
//        _REArticle_list = [arrData objectForKey:@"article_list"];
        
//        NSLog(@"%@", dic);
        
//            } Failure:^(NSError *error) {
//                
//            }];

   
        NSString *string = @"http://c.m.163.com/nc/article/list/T1348649580692/0-20.html";

    [BHNetTool GET:string Body:nil HeaderFile:nil Response:BHJSON Success:^(id result) {
        
//        NSLog(@"%@", result);
        
        self.newsArray = [NSMutableArray array];
        
        NSArray *datasArray = [result objectForKey:@"T1348649580692"];
        
        for (NSDictionary *titleDic in datasArray) {
            News *title = [News newsWithTitleDic:titleDic];
            [_newsArray addObject:title];
        }

        [_recommentTableView reloadData];
        NSLog(@"%ld", _newsArray.count);
    } Failure:^(NSError *error) {
        
    }];
    
    
}

#pragma mark - tableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"===%ld", _newsArray.count);
    return _newsArray.count - 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCSubRecommentOneTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:recommentCell];
//    newsCell.backgroundColor = [UIColor colorWithRed:1.000 green:0.973 blue:0.583 alpha:1.000];
    
    News *news = _newsArray[indexPath.row + 1];
    NSString *imageURL = news.imgsrc;
    [newsCell.recommentTypeOneImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    
    newsCell.recommentTypeOneLabel.text = news.title;
    
    
    
    return newsCell;
    
}



@end
