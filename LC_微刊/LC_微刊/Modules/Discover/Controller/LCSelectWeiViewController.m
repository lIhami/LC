//
//  LCSelectWeiViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSelectWeiViewController.h"
#import "LCMacro.h"
#import "UIImageView+WebCache.h"
#import "LCSelectMagazineTypeOneTableViewCell.h"
#import "LCSelectMagazineTypeTwoTableViewCell.h"
#import "LCSelectMagazineTypeThreeTableViewCell.h"
#import "LCSelectMagazineTypeFourTableViewCell.h"
#import "LCArticleViewController.h"
#import "Message.h"

static NSString *const string = @"cell";
static NSString *const typeTwo = @"cellTwo";
static NSString *const typeThree = @"cellThree";
static NSString *const typeFour = @"cellFour";


@interface LCSelectWeiViewController ()

<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong)UIView *topView;

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UIButton *backButton;

@property (nonatomic, strong)UITableView *magazineTableView;

@property (nonatomic, strong)NSMutableArray *messageArray;

@property (nonatomic, assign)NSInteger count;

@end

@implementation LCSelectWeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.messageArray = [NSMutableArray array];
    self.count = 2;
    
    
    [self createTableView];
    [self createHeaderView];
    
    [self getMagazineNewsDataFromJson];
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _topView.alpha = 0;
    _topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_topView];
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.1)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.alpha = 0;
    _titleLabel.text = _name;
    [self.view addSubview:_titleLabel];
    
    
    // 返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(10, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.05, SCREEN_WIDTH * 0.1);
    [_backButton setTitle:@"ㄑ" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    
    // 关注button
    UIButton *followButton = [UIButton buttonWithType:UIButtonTypeCustom];
    followButton.frame = CGRectMake(SCREEN_WIDTH * 0.7, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.06);
    [followButton setTitle:@"+订阅" forState:UIControlStateNormal];
    [followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    followButton.titleLabel.font = [UIFont systemFontOfSize:15];
    followButton.backgroundColor = [UIColor colorWithRed:0.99 green:0.42 blue:0.43 alpha:1.0];
    followButton.layer.cornerRadius = 5.0f;
    [self.view addSubview:followButton];
    

    
}

// 网络请求
- (void)getMagazineNewsDataFromJson {
    
    NSString *string = [NSString stringWithFormat:@"http://v20.tp.wkread.com/index.php/home/magazine/article?magazine_id=%@&page=1", _id];
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                @"Token": @"CQBLBTDFEQ0UDECA"};
    [BHNetTool GET:string Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        
        //        NSLog(@"%@", result);
        NSDictionary *dic = (NSDictionary *)result;
        
        NSDictionary *data = [dic objectForKey:@"data"];
        
        NSArray *article_list = [data objectForKey:@"article_list"];
        
        for (NSDictionary *messageDic in article_list) {
            Message *message = [Message messageDataWithMessageDic:messageDic];
            [_messageArray addObject:message];
        }
        
        [_magazineTableView reloadData];
        
    } Failure:^(NSError *error) {
        
    }];
    
}




#pragma mark - 创建tableView
- (void)createTableView {
    
    self.magazineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _magazineTableView.dataSource = self;
    _magazineTableView.delegate = self;
    _magazineTableView.rowHeight = 240;
    _magazineTableView.tag = 1213;
    _magazineTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_magazineTableView];
    
    
    [_magazineTableView registerClass:[LCSelectMagazineTypeFourTableViewCell class] forCellReuseIdentifier:typeFour];
    [_magazineTableView registerClass:[LCSelectMagazineTypeThreeTableViewCell class] forCellReuseIdentifier:typeThree];
    [_magazineTableView registerClass:[LCSelectMagazineTypeTwoTableViewCell class] forCellReuseIdentifier:typeTwo];
    [_magazineTableView registerClass:[LCSelectMagazineTypeOneTableViewCell class] forCellReuseIdentifier:string];
    
}



#pragma mark - 创建头视图
- (void)createHeaderView {
    
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.55)];
    topImageView.backgroundColor = [UIColor yellowColor];
    [topImageView sd_setImageWithURL:[NSURL URLWithString:_imgURL]];
    UIBlurEffect *blurFirst = [ UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectFirstView = [[ UIVisualEffectView alloc] initWithEffect:blurFirst];
    effectFirstView.frame = topImageView.frame;
    effectFirstView.alpha = 0.3f;
    [topImageView addSubview:effectFirstView];
    [_magazineTableView addSubview:topImageView];

    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.18, SCREEN_WIDTH * 0.6, SCREEN_HEIGHT * 0.1)];
    headerLabel.text = _name;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.alpha = 1;
    headerLabel.numberOfLines = 1;
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont systemFontOfSize:25];
    
    [topImageView addSubview:headerLabel];
    
    
    UILabel *nameTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.35, SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.05)];
    nameTopLabel.text = @"// 主编 //";
    nameTopLabel.textColor = [UIColor whiteColor];
    nameTopLabel.font = [UIFont systemFontOfSize:13];
    nameTopLabel.textAlignment = NSTextAlignmentCenter;
    [topImageView addSubview:nameTopLabel];
    
    UILabel *topLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.35, SCREEN_WIDTH * 0.45, SCREEN_WIDTH * 0.3, 1)];
    topLineLabel.textAlignment = NSTextAlignmentCenter;
    topLineLabel.backgroundColor = [UIColor whiteColor];
    [topImageView addSubview:topLineLabel];
    
    
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.35, SCREEN_WIDTH * 0.45 + 1, SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.08)];
    nameLabel.text = _userName;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.numberOfLines = 1;
    [topImageView addSubview:nameLabel];
    
    
    UILabel *bottomLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.35, SCREEN_WIDTH * 0.53 + 1, SCREEN_WIDTH * 0.3, 1)];
    bottomLineLabel.textAlignment = NSTextAlignmentCenter;
    bottomLineLabel.backgroundColor = [UIColor whiteColor];
    [topImageView addSubview:bottomLineLabel];
    
    
    UILabel *nameBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.35, SCREEN_WIDTH * 0.53 + 2, SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.05)];
    nameBottomLabel.text = @"A U T H O R";
    nameBottomLabel.font = [UIFont systemFontOfSize:13];
    nameBottomLabel.textColor = [UIColor whiteColor];
    nameBottomLabel.textAlignment = NSTextAlignmentCenter;
    [topImageView addSubview:nameBottomLabel];
    
    
    UILabel *scoreNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.85, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.05)];
    scoreNumberLabel.text = _scoreNumber;
    scoreNumberLabel.textColor = [UIColor whiteColor];
    scoreNumberLabel.font = [UIFont systemFontOfSize:13];
    scoreNumberLabel.textAlignment = NSTextAlignmentCenter;
    [topImageView addSubview:scoreNumberLabel];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.9, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.05)];
    scoreLabel.text = @"热度";
    scoreLabel.textColor = [UIColor whiteColor];
    scoreLabel.font = [UIFont systemFontOfSize:13];
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    [topImageView addSubview:scoreLabel];

    
    UILabel *subNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.85, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.05)];
    subNumberLabel.text = _subNumber;
    subNumberLabel.textColor = [UIColor whiteColor];
    subNumberLabel.font = [UIFont systemFontOfSize:13];
    subNumberLabel.textAlignment = NSTextAlignmentCenter;
    [topImageView addSubview:subNumberLabel];
    
    UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.9, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.05)];
    subLabel.text = @"粉丝";
    subLabel.textColor = [UIColor whiteColor];
    subLabel.font = [UIFont systemFontOfSize:13];
    subLabel.textAlignment = NSTextAlignmentCenter;
    [topImageView addSubview:subLabel];

    
    UILabel *viewNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.72, SCREEN_WIDTH * 0.85, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.05)];
    viewNumberLabel.text = _view_count;
    viewNumberLabel.textColor = [UIColor whiteColor];
    viewNumberLabel.font = [UIFont systemFontOfSize:13];
    viewNumberLabel.textAlignment = NSTextAlignmentCenter;
    [topImageView addSubview:viewNumberLabel];
    
    UILabel *viewLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.72, SCREEN_WIDTH * 0.9, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.05)];
    viewLabel.text = @"浏览";
    viewLabel.textColor = [UIColor whiteColor];
    viewLabel.font = [UIFont systemFontOfSize:13];
    viewLabel.textAlignment = NSTextAlignmentCenter;
    [topImageView addSubview:viewLabel];
    
    
    _magazineTableView.tableHeaderView = topImageView;
    
    
    
}


// 设置不同类型cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Message *message = _messageArray[indexPath.row];
    
    if (0 == message.img_status) {
        tableView.rowHeight = 90;
    } else if (1 == message.img_status) {
        tableView.rowHeight = 125;
    } else if (2 == message.img_status) {
        tableView.rowHeight = 170;
    } else if (3 == message.img_status) {
        tableView.rowHeight = 250;
    }
    
    return tableView.rowHeight;
}


#pragma mark - tableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _messageArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Message *message = _messageArray[indexPath.row];
    
    if (0 == message.img_status) {
        LCSelectMagazineTypeOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
        
        cell.titleLabel.text = message.title;
        cell.viewLbel.text = [NSString stringWithFormat:@"%@浏览", message.view_count];
        cell.commentLabel.text = [NSString stringWithFormat:@"%@评论", message.comment_count];
        
        return cell;
    } else if (1 == message.img_status) {
        
        LCSelectMagazineTypeTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:typeTwo];
        
        cell.titleLabel.text = message.title;
        cell.viewLbel.text = [NSString stringWithFormat:@"%@浏览", message.view_count];
        cell.commentLabel.text = [NSString stringWithFormat:@"%@评论", message.comment_count];
        
        NSString * imageURL = [message.images objectAtIndex:0];
        [cell.imageViewOne sd_setImageWithURL:[NSURL URLWithString:imageURL]];
        return cell;
        
    } else if (2 == message.img_status) {
        
        LCSelectMagazineTypeThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:typeThree];
        
        cell.titleLabel.text = message.title;
        cell.viewLbel.text = [NSString stringWithFormat:@"%@浏览", message.view_count];
        cell.commentLabel.text = [NSString stringWithFormat:@"%@评论", message.comment_count];
        
        NSString * imageURL = [message.images objectAtIndex:0];
        [cell.imageViewOne sd_setImageWithURL:[NSURL URLWithString:imageURL]];
        NSString * imageTwoURL = [message.images objectAtIndex:1];
        [cell.imageViewTwo sd_setImageWithURL:[NSURL URLWithString:imageTwoURL]];
        NSString * imageThreeURL = [message.images objectAtIndex:2];
        [cell.imageViewThree sd_setImageWithURL:[NSURL URLWithString:imageThreeURL]];
        
        return cell;
    } else if (3 == message.img_status) {
        
        LCSelectMagazineTypeFourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:typeFour];
        
        
        cell.titleLabel.text = message.title;
        cell.viewLbel.text = [NSString stringWithFormat:@"%@浏览", message.view_count];
        cell.commentLabel.text = [NSString stringWithFormat:@"%@评论", message.comment_count];
        
        NSString * imageURL = [message.images objectAtIndex:0];
        [cell.imageViewOne sd_setImageWithURL:[NSURL URLWithString:imageURL]];
        
        return cell;
        
    }
    
    static NSString *reusableIndentifier1 = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableIndentifier1];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableIndentifier1] ;
    }
    return cell;
    
}

// 滑动加载全部微刊
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
    if (1213 == scrollView.tag) {
        if (scrollView.contentOffset.y < 20) {
            [self getMagazineNewsDataFromJson];
        } else if (scrollView.contentOffset.y > 20 + SCREEN_HEIGHT * 0.6 + 160 * _messageArray.count  - SCREEN_HEIGHT) {
            NSString *str = [NSString stringWithFormat:@"http://v20.tp.wkread.com/index.php/home/magazine/article?magazine_id=%@&page=%ld", _id, _count];
            
            _count++;
            NSDictionary *headerDic1 = @{@"Host":@"v20.tp.wkread.com",
                                         @"Token": @"CQBLBTDFEQ0UDECA"};
            
            [BHNetTool GET:str Body:nil HeaderFile:headerDic1 Response:BHJSON Success:^(id result) {
                
                NSDictionary *dic = (NSDictionary *)result;
                
                NSDictionary *data = [dic objectForKey:@"data"];
                
                NSArray *article_list = [data objectForKey:@"article_list"];
                
                for (NSDictionary *messageDic in article_list) {
                    Message *message = [Message messageDataWithMessageDic:messageDic];
                    [_messageArray addObject:message];
                }
                
                [_magazineTableView reloadData];
            } Failure:^(NSError *error) {
                
            }];
            
            
        }
    }
}



#pragma mark - 下拉图片变清晰
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGFloat off_y = scrollView.contentOffset.y;
    CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;

    if (off_y > 0)
    {
        
      _topView.alpha = off_y * 2 / kHeight;
        
      _titleLabel.alpha = off_y * 2 / kHeight;
}

}


// 跳转页面
- (void)backButtonAction:(UIButton *)backButton {

    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


// tableView 点击cell跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LCArticleViewController *articleVC = [[LCArticleViewController alloc] init];
    
    Message *message = _messageArray[indexPath.row];
    articleVC.url = message.url;
    articleVC.read_mode_url = message.read_mode_url;
    
    [self.navigationController pushViewController:articleVC animated:YES];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
