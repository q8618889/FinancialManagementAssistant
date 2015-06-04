//
//  UuBarTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/6.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "UuBarTableViewCell.h"

@implementation UuBarTableViewCell
{
    UUChart                   *_chartView;

}

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self explain];
        [self createBar];
    }
    return self;
}
-(void)createBar
{
    
    _chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 150)
                                              withSource:self
                                               withStyle:UUChartBarStyle];
    _chartView.isThree = YES;
    [_chartView showInView:self.contentView];
    [self createLabel];
}
-(void)explain
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-280 , 12, 15, 15)];
    view.backgroundColor = BCOLOR;
    [self addSubview:view];
    UIView * views = [[UIView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-180 , 12, 15, 15)];
    views.backgroundColor = BCCOLOR;
    [self addSubview:views];
    RTLabel * lab = [[RTLabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-260, 10, MAINSCREEN_WIDTH, 20)];
    [lab setText:@"<font face='HelveticaNeue-Bold' size=13 color='#8E8E8E'>成功交易订单      </font><font face='HelveticaNeue-Bold' size=13 color='#8E8E8E'>取消交易订单</font><font face=HelveticaNeue-Bold size=13 color='#71C6E8'>      单位:  个</font></font>"];
    [self addSubview:lab];

}
//横坐标标题数组
- (NSArray *)UUChart_xLableArray:(UUChart *)chart;
{
    return @[@"一店(新世纪广场)",@"二店(金色家园)",@"三店(江东北路)"];
}
//数值多重数组
- (NSArray *)UUChart_yValueArray:(UUChart *)chart;
{
    NSArray * arr1 = @[@"8",@"10",@"14"];
    NSArray * arr2 = @[@"5",@"2",@"2"];
    return @[arr1,arr2];
}
- (NSArray *)UUChart_ColorArray:(UUChart *)chart;
{
    return @[BCOLOR,BCCOLOR];
}
-(void)createLabel
{
    NSString * oneX     = [_chartView.barChart.barFramX objectAtIndex:0];
    NSString * TwoX    = [_chartView.barChart .barFramX objectAtIndex:3];
    NSString * ThreeX   = [_chartView.barChart.barFramX objectAtIndex:1];
    NSString * fourX    = [_chartView.barChart.barFramX objectAtIndex:4];
    NSString *  fiveX   = [_chartView.barChart.barFramX objectAtIndex:2];
    NSString * sixX     = [_chartView.barChart.barFramX objectAtIndex:5];
    _labOne = [[UILabel alloc]initWithFrame:CGRectMake(oneX.floatValue-10, 120, 100, 30)];
    _labOne.textColor = BCOLOR;
    _labOne.font = [UIFont boldSystemFontOfSize:13];
    _labOne.textAlignment = NSTextAlignmentCenter;
    _labOne.text = @"9999";
    [_chartView addSubview:_labOne];
    _labTwo = [[UILabel alloc]initWithFrame:CGRectMake(TwoX.floatValue-10, 120, 100, 30)];
    _labTwo.font = [UIFont boldSystemFontOfSize:13];
    _labTwo.textColor = BCOLOR;
    _labTwo.textAlignment = NSTextAlignmentCenter;
    _labTwo.text =@"9999";
    [_chartView addSubview:_labTwo];
    _labThree = [[UILabel alloc]initWithFrame:CGRectMake(ThreeX.floatValue-10, 120, 100, 30)];
    _labThree.font = [UIFont boldSystemFontOfSize:13];
    _labThree.textColor = BCOLOR;
    _labThree.textAlignment = NSTextAlignmentCenter;
    _labThree.text = @"9999";
    [_chartView addSubview:_labThree];
    _labFour = [[UILabel alloc]initWithFrame:CGRectMake(fourX.floatValue-10, 120, 100, 30)];
    _labFour.font = [UIFont boldSystemFontOfSize:13];
    _labFour.textColor = BCOLOR;
    _labFour.textAlignment = NSTextAlignmentCenter;
    _labFour.text = @"9999";
    [_chartView addSubview:_labFour];
    _labFive = [[UILabel alloc]initWithFrame:CGRectMake(fiveX.floatValue-10, 120, 100, 30)];
    _labFive.font = [UIFont boldSystemFontOfSize:13];
    _labFive.textColor = BCOLOR;
    _labFive.textAlignment = NSTextAlignmentCenter;
    _labFive.text = @"9999";
    [_chartView addSubview:_labFive];
    _labSix = [[UILabel alloc]initWithFrame:CGRectMake(sixX.floatValue-10, 120, 100, 30)];
    _labSix.font = [UIFont boldSystemFontOfSize:13];
    _labSix.textColor = BCOLOR;
    _labSix.textAlignment = NSTextAlignmentCenter;
    _labSix.text = @"9999";
    [_chartView addSubview:_labSix];
    [self animation];

}
-(void)animation
{

    NSString * one      = [_chartView.barChart .grades objectAtIndex:0];
    NSString * Two      = [_chartView.barChart .grades objectAtIndex:3];
    NSString * Three    = [_chartView.barChart.grades objectAtIndex:1];
    NSString * four     = [_chartView.barChart.grades objectAtIndex:4];
    NSString *  five    = [_chartView.barChart.grades objectAtIndex:2];
    NSString * six      = [_chartView.barChart.grades objectAtIndex:5];
    NSString * oneX     = [_chartView.barChart.barFramX objectAtIndex:0];
    NSString * TwoX    = [_chartView.barChart .barFramX objectAtIndex:3];
    NSString * ThreeX   = [_chartView.barChart.barFramX objectAtIndex:1];
    NSString * fourX    = [_chartView.barChart.barFramX objectAtIndex:4];
    NSString *  fiveX   = [_chartView.barChart.barFramX objectAtIndex:2];
    NSString * sixX     = [_chartView.barChart.barFramX objectAtIndex:5];
    [UIView beginAnimations:@"lab" context:nil];
    [UIView setAnimationDuration:1.4];
    _labOne.frame = CGRectMake(oneX.floatValue-10, one.floatValue-23, 100, 30);
    _labTwo.frame = CGRectMake(TwoX.floatValue-10, Two.floatValue-23, 100, 30);
    _labThree.frame = CGRectMake(ThreeX.floatValue-10, Three.floatValue-23 , 100, 30);
    _labFour.frame  = CGRectMake(fourX.floatValue-10, four.floatValue-23, 100, 30);
    _labFive.frame = CGRectMake(fiveX.floatValue-10, five.floatValue-23, 100, 30);
    _labSix.frame =CGRectMake(sixX.floatValue-10, six.floatValue-23, 100, 30);
    [UIView commitAnimations];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
