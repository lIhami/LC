//
//  LCMessageViewController.m
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCMessageViewController.h"
#import "LCMacro.h"
#import "MessageTableViewCell.h"

static NSString *const messageCell = @"cellaction";

@interface LCMessageViewController ()

<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, retain)NSMutableArray *titleArray;

@end

@implementation LCMessageViewController

#pragma mark - 创建TableView
- (void)createTabelView {
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"好友动态", @"@我的消息", @"评论", @"订阅消息", @"系统消息", nil];

    UITableView *messageTabelView = [[UITableView alloc] initWithFrame:SCREEN_RECT style:0];
    messageTabelView.rowHeight = 80.f;
    messageTabelView.delegate = self;
    messageTabelView.dataSource = self;
    [self.view addSubview:messageTabelView];
    
    [messageTabelView registerClass:[MessageTableViewCell class] forCellReuseIdentifier:messageCell];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"消息中心";
    [self createTabelView];
    
}

#pragma mark - TableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
       return _titleArray.count;
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:messageCell];
    
    cell.messageLabel.text = _titleArray[indexPath.row];
    NSString *imageName = [NSString stringWithFormat:@"%@.png", _titleArray[indexPath.row]];
    cell.messageImageView.image = [UIImage imageNamed:imageName];
    
     return cell;
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
