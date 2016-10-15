//
//  LCSelectMagazineViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSelectMagazineViewController.h"
#import "LCMacro.h"
#import "TaikModel.h"
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

@interface LCSelectMagazineViewController ()

<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong)NSMutableArray *taikArray;
// 整体tableView
@property (nonatomic, strong)UITableView *taikTableView;

@property (nonatomic, strong)UIImageView *topImageView;

@property (nonatomic, strong)UIVisualEffectView *effectView;

@property (nonatomic, strong)UIImageView *topSmallImageView;

@property (nonatomic, strong)UIView *topView;

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UIButton *backButton;

@property (nonatomic, strong)NSMutableArray *messageArray;

@property (nonatomic, assign)NSInteger count;

@end

@implementation LCSelectMagazineViewController


- (void)viewWillAppear:(BOOL)animated {

    [self.navigationController setNavigationBarHidden:YES animated:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.messageArray = [NSMutableArray array];
    self.count = 2;
    
    [self createTableView];
    [self createTopImageView];
    [self createHeaderView];
    
    [self getTaikNewsDataFromJson];
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _topView.alpha = 0;
    _topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_topView];
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.1)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor lightGrayColor];
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
    [followButton setTitle:@"+关注" forState:UIControlStateNormal];
    [followButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    followButton.titleLabel.font = [UIFont systemFontOfSize:15];
    followButton.backgroundColor = [UIColor colorWithRed:0.99 green:0.42 blue:0.43 alpha:1.0];
    followButton.layer.cornerRadius = 5.0f;
    [self.view addSubview:followButton];
    
  
}


// 网络请求
- (void)getTaikNewsDataFromJson {
    
    NSString *string = [NSString stringWithFormat:@"http://v20.tp.wkread.com/index.php/home/special/article?id=%@&id=%@", _id, _id];
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
        
        [_taikTableView reloadData];
        
    } Failure:^(NSError *error) {
        
    }];
    
}

// 滑动加载全部微刊
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
    if (1212 == scrollView.tag) {
        if (scrollView.contentOffset.y < -400) {
            [self getTaikNewsDataFromJson];
        } else if (scrollView.contentOffset.y > 160 * _messageArray.count) {
            NSString *str = [NSString stringWithFormat:@"http://v20.tp.wkread.com/index.php/home/special/article?page=%ld&id=%@&id=%@", _count, _id, _id];
            
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
                
                [_taikTableView reloadData];
            } Failure:^(NSError *error) {
                
            }];
            
            
        }
    }
}




#pragma mark - 创建tableView
- (void)createTableView {

    self.taikTableView = [[UITableView alloc] initWithFrame:SCREEN_RECT style:UITableViewStylePlain];
    _taikTableView.dataSource = self;
    _taikTableView.delegate = self;
    _taikTableView.rowHeight = 240;
    _taikTableView.tag = 1212;
    _taikTableView.showsVerticalScrollIndicator = NO;
    self.taikTableView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    [self.view addSubview:_taikTableView];
    
    
    [_taikTableView registerClass:[LCSelectMagazineTypeFourTableViewCell class] forCellReuseIdentifier:typeFour];
    [_taikTableView registerClass:[LCSelectMagazineTypeThreeTableViewCell class] forCellReuseIdentifier:typeThree];
    [_taikTableView registerClass:[LCSelectMagazineTypeTwoTableViewCell class] forCellReuseIdentifier:typeTwo];
    [_taikTableView registerClass:[LCSelectMagazineTypeOneTableViewCell class] forCellReuseIdentifier:string];

}


#pragma mark - 创建顶部图片
- (void)createTopImageView {
    
//    UIScrollView *taikScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.46)];

    // 设置顶部图片
    self.topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -170, SCREEN_WIDTH, 170)];
    [_topImageView sd_setImageWithURL:[NSURL URLWithString:_imgURL]];
    _topImageView.backgroundColor = [UIColor yellowColor];
    _topImageView.contentMode = UIViewContentModeScaleAspectFill;
    _topImageView.clipsToBounds = YES;
    [_taikTableView addSubview:_topImageView];
    
    
    // 加毛玻璃效果
    UIBlurEffect *blue = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blue];
    effectView.alpha = 0.9;
    effectView.frame = _topImageView.frame;
    _effectView = effectView;
    [_taikTableView addSubview:_effectView];
    

    
    
}

#pragma mark - 创建头视图
- (void)createHeaderView {

    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT * 0.2)];
    headerLabel.text = _describe;
    headerLabel.textColor = [UIColor lightGrayColor];
    headerLabel.numberOfLines = 2;
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont systemFontOfSize:13];
    [_taikTableView addSubview:headerLabel];
    
    _taikTableView.tableHeaderView = headerLabel;
    
    
    self.topSmallImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.2)];
    [_topSmallImageView sd_setImageWithURL:[NSURL URLWithString:_imgURL]];
    CALayer * layer = [_topSmallImageView layer];
    layer.borderColor = [[UIColor whiteColor] CGColor];
    layer.borderWidth = 3.0f;
    [self.view addSubview:_topSmallImageView];
    

}


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




// 跳转页面
- (void)backButtonAction:(UIButton *)backButton {

    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


#pragma mark - 下拉图片变清晰
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 向下的话 为负数
    CGFloat off_y = scrollView.contentOffset.y;
    CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
    // 下拉超过照片的高度的时候
    
//    NSLog(@"------->%f",off_y);
    if (off_y < -170)
    {
        CGRect frame = self.topImageView.frame;
        // 这里的思路就是改变 顶部的照片的 fram
        self.topImageView.frame = CGRectMake(0, off_y, frame.size.width, -off_y);
        self.effectView.frame = self.topImageView.frame;
        // 对应调整毛玻璃的效果
        self.effectView.alpha = 0.9 + (off_y + 170) * 2 / kHeight ;
        
        _topSmallImageView.alpha = 1 + (off_y + 170) * 7 / kHeight ;
        
        
        _topSmallImageView.hidden = NO;
    
    
    } else if (off_y > -170){
        
        _topSmallImageView.hidden = YES;
        
        _topView.alpha = (off_y + 170) * 6 / kHeight;

        
        
    } else {
    
        _topSmallImageView.hidden = NO;
        
        _topView.alpha = 0;
        
    }

}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
