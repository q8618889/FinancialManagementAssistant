//
//  FinanclalViewController.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "FinanclalViewController.h"
#import "ShowsViewController.h"
@interface FinanclalViewController ()
{
    CGFloat     _width;
    CGFloat     _height;
    NSInteger   _year;
    NSString  * _weeked;
    NSString  * _monthed;
    NSString  * _dayed;
    
}
@end

@implementation FinanclalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    获取屏幕的物理尺寸
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    [self.navigationController.navigationBar setHidden:YES];
    [self createNav];
//    创建表
    [self createTableView];
//    当前日期
    [self setDate];
    
}
-(void)setDate
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekdayOrdinal;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    _year = [dateComponent year];
    NSInteger   month = [dateComponent month];
    NSInteger   day = [dateComponent day];
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"Sunday", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendare = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendare setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendare components:calendarUnit fromDate:now];
   _weeked =[weekdays objectAtIndex:theComponents.weekday];
    if (month<10)
    {
        _monthed = [NSString stringWithFormat:@"0%ld",month];
    }else{
        _monthed = [NSString stringWithFormat:@"%ld",month];
    }
    if (day<10)
    {
        _dayed = [NSString stringWithFormat:@"0%ld",day];
    }else{
        _dayed = [NSString stringWithFormat:@"%ld",day];
    }
}
#pragma mark- Nav
-(void)createNav
{
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _width, 64)];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(_width/2-76, 20, 200, 40)];
    lab.text  =@"经禅和财务管理助手";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont boldSystemFontOfSize:18.0];
    image.backgroundColor = BCOLOR;
    [image addSubview:lab];
    [self.view addSubview:image];
}
#pragma mark- myTableView
-(void)createTableView
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, _width, _height-64-49) style:UITableViewStylePlain];
    _myTableView.delegate =self;
    _myTableView.dataSource =self;
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 7;
}
#warning TableView数据无________________________________________
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([indexPath row] == 0)
    {
//         富文本排版方法内容在Cell里
        OneTableViewCell * oneCell = [[OneTableViewCell alloc]init];
        oneCell.lab_Today.text = [NSString stringWithFormat:@"<font face=GillSans size=13 color='#8E8E8E'>今日 %ld-%@-%@ %@</font>",(long)_year,_monthed,_dayed,_weeked];
        
        [oneCell.lab_Price setText:@"<font face='HelveticaNeue' size=25 color='#71C6E8'>¥</font><font face=GillSans size=45 color='#71C6E8'>6688 font</font>"];
        [oneCell.lab_Bargain setText:@"<font face='HelveticaNeue' size=15 color='#8E8E8E'>成功交易</font><font face=GillSans size=23 color='#71C6E8'>78</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font>"];
        [oneCell.lab_Countermand setText:@"<font face='HelveticaNeue' size=13 color='#8E8E8E'>退单</font><font face=GillSans size=18 color='#71C6E8'>7</font><font face='HelveticaNeue' size=13 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=13 color='#8E8E8E'>退单率</font><font face=GillSans size=18 color='#71C6E8'>7.0%</font>"];
        
        return oneCell;
    }else if ([indexPath row] == 1){
        TwoTableViewCell * tCell = [[TwoTableViewCell alloc]init];
        return tCell;
        
    }else if ([indexPath row] == 2)
    {
        ThreeTableViewCell * treeCell = [[ThreeTableViewCell alloc]init];
        treeCell.labs.text = @"近七日";
        [treeCell.TBargain setText:@"<font face='HelveticaNeue' size=15 color='#8E8E8E'>成功交易</font><font face=GillSans size=15 color='#71C6E8'>78</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单</font><font face=GillSans size=15 color='#71C6E8'>7</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单率</font><font face=GillSans size=15 color='#71C6E8'>7.0%</font>"];
        [treeCell.TPrice setText:@"<font face='HelveticaNeue' size=20 color='#71C6E8'>¥</font><font face=GillSans size=20 color='#71C6E8'>46688</font>"];
        return treeCell;
    }else if ([indexPath row] == 3){
        FourTableViewCell * fCell = [[FourTableViewCell alloc]init];
        fCell.titles.text = @"月度统计";
        fCell.titles.textColor = [UIColor whiteColor];
        return fCell;
    }else if ([indexPath row] == 4){
        ThreeTableViewCell * treeCell = [[ThreeTableViewCell alloc]init];
        treeCell.labs.text = @"当月";
        [treeCell.TBargain setText:@"<font face='HelveticaNeue' size=15 color='#8E8E8E'>成功交易</font><font face=GillSans size=15 color='#71C6E8'>78</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单</font><font face=GillSans size=15 color='#71C6E8'>7</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单率</font><font face=GillSans size=15 color='#71C6E8'>7.0%</font>"];
        [treeCell.TPrice setText:@"<font face='HelveticaNeue' size=20 color='#71C6E8'>¥</font><font face=GillSans size=20 color='#71C6E8'>46688</font>"];
        return treeCell;
    }else if ([indexPath row] == 5){
        FourTableViewCell * fCell = [[FourTableViewCell alloc]init];
        fCell.titles.text = @"年度统计";
        fCell.titles.textColor = [UIColor whiteColor];
        return fCell;
        
    }else if ([indexPath row] == 6)
    {
        ThreeTableViewCell * treeCell = [[ThreeTableViewCell alloc]init];
        treeCell.labs.text = @"今年";
        [treeCell.TBargain setText:@"<font face='HelveticaNeue' size=15 color='#8E8E8E'>成功交易</font><font face=GillSans size=15 color='#71C6E8'>78</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单</font><font face=GillSans size=15 color='#71C6E8'>7</font><font face='HelveticaNeue' size=15 color='#8E8E8E'>笔</font> <font face='HelveticaNeue' size=15 color='#8E8E8E'>退单率</font><font face=GillSans size=15 color='#71C6E8'>7.0%</font>"];
        [treeCell.TPrice setText:@"<font face='HelveticaNeue' size=20 color='#71C6E8'>¥</font><font face=GillSans size=20 color='#71C6E8'>46688</font>"];
        return treeCell;

    }

    static NSString * str = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row]==3)
    {
        
    }
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}
#pragma mark- heightForRowAtIndexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([indexPath row] == 0)
    {
        return 120;
    }else if ([indexPath row] == 1){
        return 200;
    }else if ([indexPath row] == 2){
        return 80;
    }else if ([indexPath row] == 3){
        return 44;
    }else if ([indexPath row] == 4){
        return 80;
    }else if ([indexPath row] == 5){
        return 44;
    }else if ([indexPath row] == 6){
        return 80;
    }
    return 0;
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
