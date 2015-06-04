//
//  POTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/11.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "POTableViewCell.h"

@implementation POTableViewCell

{
    NSArray                 * _numberArray;
    NSMutableArray          * _MNumberArray;
    NSArray                 * _dataArray;
    NSArray                 * _numberrr;
    NSInteger                 _width;
    NSInteger                 _height;
    UIColor                 * _tempColor;
}

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _width = MAINSCREEN_WIDTH;
        _height = MAINSCREEN_HEIGHT;
        _numberrr = [[NSMutableArray alloc]initWithObjects:@"300",@"610",@"400",@"500",nil];
        _numberArray = [[NSArray alloc]initWithObjects:@"特色理疗",@"中药理疗",@"儿科调理",@"成人调理", nil];
        _MNumberArray = [NSMutableArray array];
        [self PNChartBarType];
        [self explain];
    }
    return self;
}
//符号
-(void)explain
{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(_width-140 , 12, 15, 15)];
    view.backgroundColor = BCOLOR;
    [self addSubview:view];
    _Ylab = [[RTLabel alloc]initWithFrame:CGRectMake(_width-120, 10, 120, 20)];
    
    [self addSubview:_Ylab];
}
-(void)PNChartBarType
{
    for (NSInteger i = 0; i<4; i++)
    {
        NSString * abc = [_numberrr objectAtIndex:i];
        float value = abc.floatValue;
        EColumnDataModel * eColumn = [[EColumnDataModel alloc]initWithLabel:[NSString stringWithFormat:@"%@",[_numberArray objectAtIndex:i]] value:value index:0 unit:nil];
        [_MNumberArray addObject:eColumn];
    }
    _dataArray = [NSArray arrayWithArray:_MNumberArray];
    _eColumnChart = [[EColumnChart alloc]initWithFrame:CGRectMake(30, 30, _width-60, 150)];
    _eColumnChart.backgroundColor =[UIColor clearColor];
    [_eColumnChart setDelegate:self];
    [_eColumnChart setDataSource:self];
    [self addSubview:_eColumnChart];
    NSString * oneX = [_eColumnChart.chartXArray objectAtIndex:0];
    NSString * TwoX = [_eColumnChart.chartXArray objectAtIndex:1];
    NSString * ThreeX = [_eColumnChart.chartXArray objectAtIndex:2];
    NSString * FourX = [_eColumnChart.chartXArray objectAtIndex:3];
    _labOne = [[UILabel alloc]initWithFrame:CGRectMake(oneX.floatValue-40, 130, 100, 30)];
    _labOne.textColor = BCOLOR;
    _labOne.textAlignment = NSTextAlignmentCenter;
    _labOne.text = [_numberrr objectAtIndex:3];
    [_eColumnChart addSubview:_labOne];
    _labTwo = [[UILabel alloc]initWithFrame:CGRectMake(TwoX.floatValue-40, 130, 100, 30)];
    _labTwo.textColor = BCOLOR;
    _labTwo.textAlignment = NSTextAlignmentCenter;
    _labTwo.text = [_numberrr objectAtIndex:2];
    [_eColumnChart addSubview:_labTwo];
    _labThree = [[UILabel alloc]initWithFrame:CGRectMake(ThreeX.floatValue-40, 130, 100, 30)];
    _labThree.textColor = BCOLOR;
    _labThree.textAlignment = NSTextAlignmentCenter;
    _labThree.text = [_numberrr objectAtIndex:1];
    [_eColumnChart addSubview:_labThree];
     _labFour = [[UILabel alloc]initWithFrame:CGRectMake(FourX.floatValue-40, 130, 100, 30)];
    _labFour.textColor = BCOLOR;
    _labFour.textAlignment = NSTextAlignmentCenter;
    _labFour.text = [_numberrr objectAtIndex:0];
    [_eColumnChart addSubview:_labFour];
    [self animation];
}
-(void)animation
{
    
    NSString * one = [_eColumnChart.gradesArray objectAtIndex:0];
    NSString * Two = [_eColumnChart.gradesArray objectAtIndex:1];
    NSString * Three = [_eColumnChart.gradesArray objectAtIndex:2];
    NSString * Four =  [_eColumnChart.gradesArray objectAtIndex:3];
    NSString * oneX = [_eColumnChart.chartXArray objectAtIndex:0];
    NSString * TwoX = [_eColumnChart.chartXArray objectAtIndex:1];
    NSString * ThreeX = [_eColumnChart.chartXArray objectAtIndex:2];
    NSString * FourX  = [_eColumnChart.chartXArray objectAtIndex:3];
    [UIView beginAnimations:@"lab" context:nil];
    [UIView setAnimationDuration:1];
    _labOne.frame = CGRectMake(oneX.floatValue-40, one.floatValue, 100, 30);
    _labTwo.frame = CGRectMake(TwoX.floatValue-40, Two.floatValue, 100, 30);
    _labThree.frame = CGRectMake(ThreeX.floatValue-40, Three.floatValue, 100, 30);
    _labFour.frame = CGRectMake(FourX.floatValue-40, Four.floatValue, 100, 30);
    [UIView commitAnimations];
}
#pragma mark- dataSource
/** How many Columns are there in total.*/
- (NSInteger) numberOfColumnsInEColumnChart:(EColumnChart *) eColumnChart;
{
    return [_dataArray count];
}

/** How many Columns should be presented on the screen each time*/
- (NSInteger) numberOfColumnsPresentedEveryTime:(EColumnChart *) eColumnChart;
{
    return 4;
}
/** The hightest vaule among the whole chart*/
- (EColumnDataModel *)     highestValueEColumnChart:(EColumnChart *) eColumnChart;
{
    EColumnDataModel * maxDataModel = nil;
    float maxValue = -FLT_MIN;
    for (EColumnDataModel * dataModel in _dataArray)
    {
        if (dataModel.value > maxValue)
        {
            maxValue = dataModel.value;
            maxDataModel = dataModel;
        }
    }
    return maxDataModel;
}

/** Value for each column*/
- (EColumnDataModel *)     eColumnChart:(EColumnChart *) eColumnChart
                          valueForIndex:(NSInteger)index;
{
    if (index >= [_dataArray count]|| index<0)return nil;
    return [_dataArray objectAtIndex:index];
    
}
#pragma mark- deleate
/** When finger single taped the column*/
- (void)        eColumnChart:(EColumnChart *) eColumnChart
             didSelectColumn:(EColumn *) eColumn;
{
    
}

/** When finger enter specific column, this is dif from tap*/
- (void)        eColumnChart:(EColumnChart *) eColumnChart
        fingerDidEnterColumn:(EColumn *) eColumn;
{
    
}

/** When finger leaves certain column, will
 tell you which column you are leaving*/
- (void)        eColumnChart:(EColumnChart *) eColumnChart
        fingerDidLeaveColumn:(EColumn *) eColumn;
{
    
}

/** When finger leaves wherever in the chart,
 will trigger both if finger is leaving from a column */
- (void) fingerDidLeaveEColumnChart:(EColumnChart *)eColumnChart;
{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
