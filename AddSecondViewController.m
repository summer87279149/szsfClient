//
//  AddSecondViewController.m
//  数据库
//
//  Created by Admin on 16/10/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "AddSecondViewController.h"
#import "CityDB.h"
#define dataBaseName @"China.sqlite"
@interface AddSecondViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     BOOL isSelectCity;
    UITableView *tableview;
}
@property(nonatomic,strong)NSString *selectedCity;//选中的市
@property(nonatomic,strong)NSString *selectedCityCode;//选中的市
@end

@implementation AddSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(submit)];
    HaHaHaAddBackGroundImage
    isSelectCity = NO;
    [self createTableView];
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
    return self.citysArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    CityModel *privce = self.citysArr[indexPath.row];
    cell.textLabel.text= privce.cityName;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    isSelectCity = YES;
    CityModel *privce = self.citysArr[indexPath.row];
    self.selectedCity = privce.cityName;
    self.selectedCityCode = privce.ids;
    NSLog(@"当前城市代码是:%@",privce.ids);
}

-(void)submit{
    
    if (isSelectCity == NO) {
        [MBProgressHUD showError:@"请选择一个城市"];
        return ;
    }
    [[NSUserDefaults standardUserDefaults]setObject:self.selectedCityCode forKey:CITYCODE];
    [[NSUserDefaults standardUserDefaults]setObject:self.selectedCity forKey:CITYNAME];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:self.selectedCity forKey:@"city"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"chooseCity" object:nil userInfo:dict];
    [self sureCancel];
}
-(void)sureCancel{
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
