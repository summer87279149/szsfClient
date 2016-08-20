//
//  TechCommentVController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "TechnicianMode.h"
#import "TechCommentVController.h"
#import "ThreeTableViewCell.h"
#import "CommentCellModel.h"
@interface TechCommentVController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
}
@end

@implementation TechCommentVController

- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.separatorColor = COLOR;
    [self.view addSubview: tableview];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableview cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"cell";
    ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[ThreeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
