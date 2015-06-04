//
//  ProjectAViewController.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "ProjectAViewController.h"
#import "POTableViewCell.h"
#import "PTTableViewCell.h"
#import "PHTableViewCell.h"
#import "PFTableViewCell.h"
@interface ProjectAViewController ()
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

@implementation ProjectAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self setDate];
    _width = MAINSCREEN_WIDTH;
    _height= MAINSCREEN_HEIGHT;
    _YYLabel  = @"月收益";

    [self.navigationController.navigationBar setHidden:YES];
    [self createTableView];
    [self createNav];
    
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
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(_width/2-50, 20, 150, 40)];
    lab.text  =@"项目经营分析";
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
-(void)createTableView
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+40, _width, _height-64-49-40) style:UITableViewStylePlain];
    NSLog(@"%f",MAINSCREEN_HEIGHT-64-49);
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (_isYear == NO)
    {
        return 3;
    }else{
        return 4;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    

    if ([indexPath row] == 0)
    {
        POTableViewCell * po = [[POTableViewCell alloc]init];
        [po.Ylab setText:[NSString stringWithFormat:@"<font face='HelveticaNeue-Bold' size=13 color='#8E8E8E'>%@</font><font face=HelveticaNeue-Bold size=13 color='#71C6E8'>   单位:  元</font></font>",_YYLabel]];
        return po;
    }
    if ([indexPath row] == 1)
    {
        PTTableViewCell * pieChartCell = [[PTTableViewCell alloc]init];
        return pieChartCell;
    }
    if ([indexPath row] == 2)
    {
        PHTableViewCell * uuCell = [[PHTableViewCell alloc]init];
        return uuCell;
    }
    if ([indexPath row] == 3)
    {
        PFTableViewCell *  yearLine = [[PFTableViewCell alloc ]init];
        yearLine.Rlabel.text = [NSString stringWithFormat:@"%@项目每月收益折线图",_dateLabel.text];
        [yearLine.Fbutton addTarget:self action:@selector(pushBtn:) forControlEvents:UIControlEventTouchUpInside];
        return yearLine;
    }
    static NSString * str =@"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    return cell;
    //return po
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 1)
    {
        return 150;
    }
    return 200;
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushBtn:(UIButton *)btn
{
    
 
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
