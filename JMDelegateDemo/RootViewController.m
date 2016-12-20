//
//  RootViewController.m
//  JMDelegateDemo
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RootViewController.h"
#import "JMCustomCell.h"
///第四步 遵守协议
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource,JMCustomCellDelegate>
@property (nonatomic,strong) UITableView *myTableView;
@end

@implementation RootViewController
static NSString *jmCustomCellIdentifier = @"jmCustomCell";
- (UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return _myTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
}
- (void)setUpView
{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    //注册xib 自定义cell
    [self.myTableView registerNib:[UINib nibWithNibName:@"JMCustomCell" bundle:nil] forCellReuseIdentifier:jmCustomCellIdentifier];
    
}

#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMCustomCell *jmCustomCell = [tableView dequeueReusableCellWithIdentifier:jmCustomCellIdentifier forIndexPath:indexPath];
    ///第五步 设置代理
    jmCustomCell.delegate = self;
    return jmCustomCell;
}



///第六步 实现代理方法

- (void)jmCustomCellPlusBtDidClickWithCustomCell:(JMCustomCell *)customCell
{
    NSLog(@"加号被点击了");
    //同时我们可以根据协议返回的cell找到按钮点击的那个cell的具体位置(即index)
    
    NSIndexPath *index = [self.myTableView indexPathForCell:customCell];
    NSLog(@"点击的是第%ld行的cell",index.row);
}

- (void)jmCustomCellMinusBtDidClickWithCustomCell:(JMCustomCell *)customCell
{
    NSLog(@"减号被点击了");

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
