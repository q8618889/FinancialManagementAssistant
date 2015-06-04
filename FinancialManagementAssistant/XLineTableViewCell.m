
//
//  XLineTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/10.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "XLineTableViewCell.h"

@implementation XLineTableViewCell
{
    NSMutableArray                 * _dateArray;
}

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithYear:(NSString *)year
{
    self = [super init];
    if (self) {
        
        _dataArray = [[NSArray alloc]init];
        _dateArray = [[NSMutableArray alloc]init];
        [self createBEM];
        _price =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
        _price.textColor = [UIColor whiteColor];
        [self addSubview:_price];
        _price.text =[NSString stringWithFormat:@"%@%@月%@元",year,[_dateArray objectAtIndex:0],[_dataArray objectAtIndex:0]];
        
    }
    return self;
}
-(void)createBEM
{
    _dataArray = @[@"12",@"13",@"19",@"15",@"17",@"11",@"19",@"15",@"12",@"21",@"23",@"30",];
    for (NSInteger i = 1; i<13; i++)
    {
        [_dateArray addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    if (isRetina||iPhone5)
    {
        _BEMSimplelines = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 30, 280, 184-30)];
        _BEMSimplelines.delegate = self;
        _BEMSimplelines.colorBottom  = [UIColor clearColor];
        _BEMSimplelines.colorXaxisLabel = [UIColor whiteColor];
        _BEMSimplelines.enableTouchReport = YES;
        _BEMSimplelines.colorLine    = [UIColor whiteColor];
        _BEMSimplelines.widthLine    = 3.0;
        [self addSubview:_BEMSimplelines];
        _BEMSimplelines.enableTouchReport = YES;
        
    }
    if (iPhone6)
    {
        _BEMSimplelines = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 30, 325, 184-30)];
        _BEMSimplelines.delegate = self;
        _BEMSimplelines.colorBottom  = [UIColor clearColor];
        _BEMSimplelines.colorXaxisLabel = [UIColor whiteColor];
        _BEMSimplelines.enableTouchReport = YES;
        _BEMSimplelines.colorLine    = [UIColor whiteColor];
        _BEMSimplelines.widthLine    = 3.0;
        [self addSubview:_BEMSimplelines];
        _BEMSimplelines.enableTouchReport = YES;
    }
    if (iPhone6P)
    {
        _BEMSimplelines = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 30, 365, 184-30)];
        _BEMSimplelines.delegate = self;
        _BEMSimplelines.colorBottom  = [UIColor redColor];
        _BEMSimplelines.colorXaxisLabel = [UIColor whiteColor];
        _BEMSimplelines.enableTouchReport = YES;
        _BEMSimplelines.colorLine    = [UIColor whiteColor];
        _BEMSimplelines.widthLine    = 3.0;
        [self addSubview:_BEMSimplelines];
        _BEMSimplelines.enableTouchReport = YES;
    }
    
    

}
- (int)numberOfPointsInGraph;
{
    return (int)[_dataArray count];
}
- (float)valueForIndex:(NSInteger)index;
{
    return [[_dataArray objectAtIndex:index] floatValue];
}
-(int)numberOfGapsBetweenLabels
{
    return 0;
}
-(NSString *)labelOnXAxisForIndex:(NSInteger)index
{
    return [_dateArray objectAtIndex:index];
}

-(void)didTouchGraphWithClosestIndex:(int)index
{
   // NSArray * array = [[_dateArray reverseObjectEnumerator]allObjects];
    _price.text =[NSString stringWithFormat:@"%@%@月%@元",_year,[_dateArray objectAtIndex:index],[_dataArray objectAtIndex:index]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
