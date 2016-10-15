//
//  LCSearchViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/12.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSearchViewController.h"
#import "LCMacro.h"
#import "NSString+Categories.h"
#import "LCSelectWeiViewController.h"
#import "LCSelectMagazineViewController.h"
#import "LCArticleViewController.h"

static NSString *const stringOne = @"cellOne";
static NSString *const stringTwo = @"cellTwo";
static NSString *const stringThree = @"cellThree";
static NSString *const stringFour = @"cellFour";

@interface LCSearchViewController ()

<
UITextFieldDelegate,
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong)UITextField *searchTextField;

@property (nonatomic, copy)NSString *text;

@property (nonatomic, strong)NSMutableArray *specialArray;

@property (nonatomic, strong)NSMutableArray *magazineArray;

@property (nonatomic, strong)NSMutableArray *userArray;

@property (nonatomic, strong)NSMutableArray *articleArray;

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation LCSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.specialArray = [NSMutableArray array];
    self.magazineArray = [NSMutableArray array];
    self.userArray = [NSMutableArray array];
    self.articleArray = [NSMutableArray array];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    
    UIImageView *searchImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.06)];
    searchImageView.image = [UIImage imageNamed:@"搜索.png"];
    
    
    self.searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.9, SCREEN_WIDTH * 0.06)];
    _searchTextField.backgroundColor = [UIColor colorWithRed:0.93 green:0.94 blue:0.95 alpha:1.0];
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    _searchTextField.leftView = searchImageView;
    _searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    _searchTextField.delegate = self;
    [_searchTextField addTarget:self action:@selector(changeEditing:) forControlEvents:UIControlEventEditingChanged] ;
    [topView addSubview:_searchTextField];

    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(SCREEN_WIDTH * 0.91, 0, SCREEN_WIDTH * 0.1, 64);
    [backButton setTitle:@"X" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    // 创建tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _tableView.rowHeight = 60.f;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:stringOne];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:stringTwo];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:stringThree];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:stringFour];
    
  
    
}


- (void)backButtonAction:(UIButton *)backButton {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)changeEditing:(UITextField *)textField  {

    NSLog(@"%@", textField.text);
    
    NSString *string = [NSString stringWithFormat:@"http://v20.tp.wkread.com/index.php/home/Discovery/searchByType?type=0&word=%@", [textField.text urlEncode]];
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                @"Token": @"CQBLBTDFEQ0UDECA"};
    [BHNetTool GET:string Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        

        NSDictionary *dic = (NSDictionary *)result;
        
        NSDictionary *data = [dic objectForKey:@"data"];
        
        NSDictionary *special = [data objectForKey:@"special"];
        NSDictionary *magazine = [data objectForKey:@"magazine"];
        NSDictionary *user = [data objectForKey:@"user"];
        NSDictionary *article = [data objectForKey:@"article"];
        
        
        NSArray *special_list = [special objectForKey:@"special_list"];
        NSArray *magazine_list = [magazine objectForKey:@"magazine_list"];
        NSArray *user_list = [user objectForKey:@"user_list"];
        NSArray *article_list = [article objectForKey:@"article_list"];
        
        
        _specialArray = [NSMutableArray arrayWithArray:special_list];
        _magazineArray = [NSMutableArray arrayWithArray:magazine_list];
        _userArray = [NSMutableArray arrayWithArray:user_list];
        _articleArray = [NSMutableArray arrayWithArray:article_list];
        
        
        [_tableView reloadData];
        
    } Failure:^(NSError *error) {
        
        NSLog( @"失败了");
        
    }];
    
}

// 分区的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *headerTitleArray = @[@"｜话题", @"｜微刊", @"｜用户", @"｜文章"];
    return headerTitleArray[section];
    
}


// 判断分区
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (0 == section) {
        if (0 == _specialArray.count) {
            return 0;
        } else {
            return 40.f;
        }
    }
    
    if (1 == section) {
        if (0 == _magazineArray.count) {
            return 0;
        } else {
            return 40.f;
        }
    }
    
    if (2 == section) {
        if (0 == _userArray.count) {
            return 0;
        } else {
            return 40.f;
        }
    }
    
    if (3 == section) {
        if (0 == _articleArray.count) {
            return 0;
        } else {
            return 40.f;
        }
    }
    
    return 60.f;

}


// 分区数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}


// 不同分区cell数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if (0 == section) {
        return _specialArray.count;
    } else if (1 == section) {
        return _magazineArray.count;
    } else if (2 == section) {
        return _userArray.count;
    }
    return _articleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 第一个分区cell
    if (0 == indexPath.section) {
        UITableViewCell *cellOne = [tableView dequeueReusableCellWithIdentifier:stringOne];
        
        cellOne.textLabel.text = [NSString stringWithFormat:@"%@", [_specialArray[indexPath.row] objectForKey:@"name"]];
        
        return  cellOne;
    } else if (1 == indexPath.section) {
        UITableViewCell *cellTwo = [tableView dequeueReusableCellWithIdentifier:stringTwo];
        
        cellTwo.textLabel.text = [NSString stringWithFormat:@"%@", [_magazineArray[indexPath.row] objectForKey:@"title"]];
        
        return  cellTwo;
    
    } else if (2 == indexPath.section) {
        
        UITableViewCell *cellThree = [tableView dequeueReusableCellWithIdentifier:stringThree];
        
        cellThree.textLabel.text = [NSString stringWithFormat:@"%@", [_userArray[indexPath.row] objectForKey:@"nickname"]];
        
        return  cellThree;
        
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringFour];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_articleArray[indexPath.row] objectForKey:@"title"]];
    
    return  cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (0 == indexPath.section) {
        LCSelectMagazineViewController *magVC = [[LCSelectMagazineViewController alloc] init];
        
        magVC.id  = [_specialArray[indexPath.row] objectForKey:@"id"];
        magVC.describe = @"说点什么呢。。。。";
        magVC.name = [_specialArray[indexPath.row] objectForKey:@"title"];
        magVC.imgURL = [[_specialArray[indexPath.row] objectForKey:@"img_info"] objectForKey:@"src"];
        
        
        [[self navigationController] pushViewController:magVC animated:YES];
        
    } else if (1 == indexPath.section) {
        
        LCSelectWeiViewController *weiVC = [[LCSelectWeiViewController alloc] init];
        
        weiVC.id = [_magazineArray[indexPath.row] objectForKey:@"id"];
        weiVC.name = [_magazineArray[indexPath.row] objectForKey:@"title"];
        weiVC.scoreNumber = [_magazineArray[indexPath.row] objectForKey:@"article_count"];
        weiVC.view_count = [_magazineArray[indexPath.row] objectForKey:@"view-count"];
        weiVC.subNumber = [_magazineArray[indexPath.row] objectForKey:@"subscribe_count"];
        weiVC.imgURL = [[_magazineArray[indexPath.row] objectForKey:@"img_info"] objectForKey:@"src"];
        
        [self.navigationController pushViewController:weiVC animated:YES];
        
    } else if (3 == indexPath.section) {
        LCArticleViewController *artVC = [[LCArticleViewController alloc] init];
        
        artVC.url = [_articleArray[indexPath.row] objectForKey:@"url"];
        
        [self.navigationController pushViewController:artVC animated:YES];
    
    }




}


// 点击return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField endEditing:YES];
//    [textField resignFirstResponder];
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
