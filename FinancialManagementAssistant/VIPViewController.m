//
//  VIPViewController.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "VIPViewController.h"
#import "VIPSTableViewCell.h"
#import "MultipleTableViewCell.h"
@interface VIPViewController ()
{
    UITableView * _myTableView;
    UILabel     * _dateLabel;
    CGFloat     _width;
    CGFloat     _height;
    NSInteger   _year;
    NSInteger   _month;
    NSInteger   _NewYear;
    NSInteger   _NewMonth;
    BOOL        _isYear;
}

@end

@implementation VIPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    _width =  MAINSCREEN_WIDTH;
    _height=  MAINSCREEN_HEIGHT;
    [self setDate];
    [self createTableView];
    [self createNav];
}
-(void)createTableView
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+40-20, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT-64-49-20) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];

}
-(void)setDate
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekdayOrdinal;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    _year       = [dateComponent year];
    _month      = [dateComponent month];
    _NewYear    = _year;
    _NewMonth   = _month;
}

-(void)createNav
{
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _width, 64+40)];
    image.userInteractionEnabled = YES;
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(_width/2-35, 20, 150, 40)];
    lab.text  =@"会员分析";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont boldSystemFontOfSize:18.0];
    image.backgroundColor = BCOLOR;
    [image addSubview:lab];
    UIButton * left = [UIButton buttonWithType:UIButtonTypeCustom];
    left.frame = CGRectMake(10, 70, 30, 30);
    [left setBackgroundImage:[UIImage imageNamed:@"AL.png"] forState:UIControlStateNormal];
    left.tag = 1;
    [left addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [image  addSubview:left];
    UIButton * right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake(_width-10-25, 70, 30, 30);
    [right setBackgroundImage:[UIImage imageNamed:@"AR.png"] forState:UIControlStateNormal];
    right.tag = 2;
    [right addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [image  addSubview:right];
    [self.view addSubview:image];
    UIButton * month = [UIButton buttonWithType:UIButtonTypeCustom];
    month.frame = CGRectMake(_width - 50, 15, 50, 50);
    [month setTitle:@"按月" forState:UIControlStateNormal];
    [month addTarget:self action:@selector(mBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [image addSubview:month];
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake((_width-150)/2+35,64, 150, 40)];
    _dateLabel.alpha = 0.7;
    _dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",(long)_year,(long)_month];
    _dateLabel.textColor = [UIColor whiteColor];
    [image addSubview:_dateLabel];
}

-(void)mBtnClick:(UIButton *)btn
{
    
    if (_isYear == NO)
    {
        _dateLabel.frame = CGRectMake((_width-150)/2+50,64, 150, 40);
        _YYLabel = @"年收益";
        _dateLabel.text = [NSString stringWithFormat:@"%ld年",_year];
        [btn setTitle:@"按年" forState:0];
        _isYear = YES;
    }else{
        _dateLabel.frame = CGRectMake((_width-150)/2+35,64, 150, 40);
        _YYLabel = @"月收益";
        if (_year == _NewYear)
        {
            if(_month>_NewMonth)
            {
                _month = _NewMonth;
                _dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",_year,_month];
            }else {
                _dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",_year,_month];
            }
        }else{
            
            _dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",_year,_month];
        }
        [btn setTitle:@"按月" forState:0];
        _isYear = NO;
    }
    [_myTableView reloadData];
}
-(void)buttonClick:(UIButton *)btn
{
    
    if (_isYear == NO)
    {
        if (btn.tag == 2)
        {
            if (_year == _NewYear&_month == _NewMonth)
            {
                return;
            }
            _month++;
            if (_month >12)
            {
                _year++;
                _month = 1;
            }
            _dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",(long)_year,(long)_month];
        }
        if (btn.tag == 1)
        {
            _month--;
            if (_month <1)
            {
                _year--;
                _month = 12;
            }
            _dateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",(long)_year,(long)_month];
        }
        
    }else{
        
        if (btn.tag == 2)
        {
            if (_year == _NewYear)
            {
                return;
            }
            _year++;
            _dateLabel.text = [NSString stringWithFormat:@"%ld年",(long)_year];
        }else{
            
            _year--;
            _dateLabel.text = [NSString stringWithFormat:@"%ld年",(long)_year];
        }
    }
    
    [_myTableView reloadData];
    
}
#pragma mark- tableViewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([indexPath row] ==0 )
   {
        VIPSTableViewCell * vcell = [[VIPSTableViewCell alloc]init];
       vcell.userInteractionEnabled = NO;
       [vcell.NewRegistration setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>新注册:</font>  <font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>52</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
       [vcell.VIPMembers setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>会员总数:</font>  <font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>4326</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
        return vcell;
   }else{
       MultipleTableViewCell * mc = [[MultipleTableViewCell alloc]init];
       mc.userInteractionEnabled = NO;
       if ([indexPath row] == 1)
       {
           [mc.labOne setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>消费会员:</font>  <font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>316</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
           [mc.labTwo setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>消费总额:</font>  <font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>166688</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>元</font>"]];
           [mc.labThree setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人均消费:</font>  <font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>527.49</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>元</font>"]];
           mc.titles.text = @"消费统计";
        }
       if ([indexPath row] == 2)
       {
           mc.titles.text = @"活跃分析";
           [mc.labOne setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>活跃会员:</font>  <font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>消费大于4次</font><font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>126</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
           [mc.labTwo setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>忠诚会员:</font>  <font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>每周持续消费</font><font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>45</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
           [mc.labThree setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>沉默会员:</font>  <font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>超过一个月未使用</font><font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>276</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
       }
       if([indexPath row] == 3){
           mc.titles.text = @"会员卡";
           [mc.labOne setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>充值人数:</font>  <font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>763</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
           [mc.labTwo setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>累计充值:</font>  <font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>535350</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
           [mc.labThree setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>会员卡充值:</font>  <font face='HelveticaNeue-Bold' size=17 color='#71C6E8'>66688</font><font face='HelveticaNeue-Bold' size=17 color='#8E8E8E'>人</font>"]];
       }
       return mc;
   }
 }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 0)
    {
        return 100;
    }
    return 130;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
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
