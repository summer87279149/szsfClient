//
//  AddViewController.m
//  数据库
//
//  Created by Admin on 16/10/10.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "AddSecondViewController.h"
#import "AddViewController.h"
#import "CityDB.h"
#define dataBaseName @"China.sqlite"
@interface AddViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
}
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    [self readDataBase];
    [self createTableView];
}
-(void)readDataBase{
    self.privicesArr = [NSMutableArray arrayWithCapacity:0];
    self.privicesArr=[[CityDB ShareDB] selectAllProvince:dataBaseName];
}
-(void)createTableView{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableview];
}

#pragma mark - datasource delegte
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.privicesArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
     CityModel *privce = self.privicesArr[indexPath.row];
    cell.textLabel.text= privce.cityName;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AddSecondViewController *second = [[AddSecondViewController alloc]init];
    CityModel *privce = self.privicesArr[indexPath.row];
    second.citysArr = [NSMutableArray arrayWithCapacity:0];
    second.citysArr = [[CityDB ShareDB] selectCityByProvince:privce dbName:dataBaseName];
        [self .navigationController pushViewController:second animated:YES];
   
    
}
-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
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
