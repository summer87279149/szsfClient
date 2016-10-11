

#import "OrderAddressViewController.h"

@interface OrderAddressViewController (){
    BOOL isSelectCity;
}
@property(nonatomic,strong)NSIndexPath *selectedIndexPath;//当前选中的NSIndexPath
@end

@implementation OrderAddressViewController


-(void)viewDidLoad{
    HaHaHaAddBackGroundImage
    [self configureData];
    [self configureViews];
    
}


-(void)configureData{
    if (self.displayType == kDisplayProvince) {
        //从文件读取地址字典
        NSString *addressPath = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"plist"];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithContentsOfFile:addressPath];
        self.provinces = [dict objectForKey:@"address"];
    }
}


-(void)configureViews{
    if (self.displayType == kDisplayProvince) { //只在选择省份页面显示取消按钮
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    }
    if (self.displayType == kDisplayArea) {//只在选择区域页面显示确定按钮
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(submit)];
    }
    CGRect frame = [self.view bounds];
    self.tableView = [[UITableView alloc]initWithFrame:frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.displayType == kDisplayProvince) {
        return self.provinces.count;
    }else if (self.displayType == kDisplayCity){
        return self.citys.count;
    }else{
        return self.areas.count;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        if (self.displayType == kDisplayArea) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.backgroundColor = [UIColor clearColor];
        }else{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
               cell.backgroundColor = [UIColor clearColor];
        }
    }
    if (self.displayType == kDisplayProvince) {
        NSDictionary *province = self.provinces[indexPath.row];
        NSString *provinceName = [province objectForKey:@"name"];
        cell.textLabel.text= provinceName;
           cell.backgroundColor = [UIColor clearColor];
    }else if (self.displayType == kDisplayCity){
        NSDictionary *city = self.citys[indexPath.row];
        NSString *cityName = [city objectForKey:@"name"];
        cell.textLabel.text= cityName;
           cell.backgroundColor = [UIColor clearColor];
    }else{
        cell.textLabel.text= self.areas[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"unchecked"];
           cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.displayType == kDisplayProvince) {
        isSelectCity = NO;
        NSDictionary *province = self.provinces[indexPath.row];
        NSArray *citys = [province objectForKey:@"sub"];
        self.selectedProvince = [province objectForKey:@"name"];
        //构建下一级视图控制器
        OrderAddressViewController *cityVC = [[OrderAddressViewController alloc]init];
        cityVC.displayType = kDisplayCity;//显示模式为城市
        cityVC.citys = citys;
        cityVC.selectedProvince = self.selectedProvince;
        [self.navigationController pushViewController:cityVC animated:YES];
    }else if (self.displayType == kDisplayCity){
        isSelectCity = NO;
        NSDictionary *city = self.citys[indexPath.row];
        self.selectedCity = [city objectForKey:@"name"];
        NSArray *areas = [city objectForKey:@"sub"];
        //构建下一级视图控制器
        OrderAddressViewController *areaVC = [[OrderAddressViewController alloc]init];
        areaVC.displayType = kDisplayArea;//显示模式为区域
        areaVC.areas = areas;
        areaVC.selectedCity = self.selectedCity;
        areaVC.selectedProvince = self.selectedProvince;
        [self.navigationController pushViewController:areaVC animated:YES];
    }
    else{
        isSelectCity = YES;
        //取消上一次选定状态
        UITableViewCell *oldCell =  [tableView cellForRowAtIndexPath:self.selectedIndexPath];
        oldCell.imageView.image = [UIImage imageNamed:@"unchecked"];
        //勾选当前选定状态
        UITableViewCell *newCell =  [tableView cellForRowAtIndexPath:indexPath];
        newCell.imageView.image = [UIImage imageNamed:@"checked"];
        //保存
        self.selectedArea = self.areas[indexPath.row];
        self.selectedIndexPath = indexPath;
    }
    
}


-(void)submit{
    if (isSelectCity == NO) {
        [MBProgressHUD showError:@"未选择地区"];
        return;
    }
    if (self.selectedProvince == nil) {
        self.selectedProvince =@"位置省份";
    }
    if (self.selectedCity==nil) {
        self.selectedCity=@"未知城市";
    }
    if (self.selectedArea==nil) {
        self.selectedArea=@"未知地区";
    }
//    NSString *msg = [NSString stringWithFormat:@"%@-%@-%@",self.selectedProvince,self.selectedCity,self.selectedArea];
//    NSLog(@"%@",msg);
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:self.selectedProvince,@"province",self.selectedCity,@"city",self.selectedArea,@"area", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"chooseAdd" object:nil userInfo:dict];
    [self sureCancel];
}


-(void)sureCancel{
    
    [self dismissViewControllerAnimated:YES completion:^{
//        [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@-%@-%@",self.selectedProvince,self.selectedCity,self.selectedArea]];
    }];
}

-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
