//
//  TwoTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "TwoTableViewCell.h"
#import "BEMSimpleLineGraphView.h"
@implementation TwoTableViewCell
{
    BEMSimpleLineGraphView  * _BEMSimpleline;
 
    NSMutableArray          * _dateArray;
    NSArray                 * _dataArray2;
    NSInteger                 _day;
    NSInteger                 _monthed;

}

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        self.backgroundColor = [UIColor colorWithRed:113.0/255.0 green:198.0/255.0 blue:232.0/255.0 alpha:1.0];
        _dateArray = [[NSMutableArray alloc]init];
         [self Date];
        
        if (isRetina||iPhone5)
        {
            _BEMSimpleline = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 20, 280, 180)];
            _BEMSimpleline.delegate = self;
            _BEMSimpleline.colorBottom  = [UIColor clearColor];
            _BEMSimpleline.colorXaxisLabel = [UIColor whiteColor];
            _BEMSimpleline.enableTouchReport = YES;
            _BEMSimpleline.colorLine    = [UIColor whiteColor];
            _BEMSimpleline.widthLine    = 3.0;
            [self addSubview:_BEMSimpleline];
            _BEMSimpleline.enableTouchReport = YES;
            
        }
        if (iPhone6)
        {
            _BEMSimpleline = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 20, 325, 180)];
            _BEMSimpleline.delegate = self;
            _BEMSimpleline.colorBottom  = [UIColor clearColor];
            _BEMSimpleline.colorXaxisLabel = [UIColor whiteColor];
            _BEMSimpleline.enableTouchReport = YES;
            _BEMSimpleline.colorLine    = [UIColor whiteColor];
            _BEMSimpleline.widthLine    = 3.0;
            [self addSubview:_BEMSimpleline];
            _BEMSimpleline.enableTouchReport = YES;
        }
        if (iPhone6P)
        {
            _BEMSimpleline = [[BEMSimpleLineGraphView alloc]initWithFrame:CGRectMake(30, 20, 365, 180)];
            _BEMSimpleline.delegate = self;
            _BEMSimpleline.colorBottom  = [UIColor clearColor];
            _BEMSimpleline.colorXaxisLabel = [UIColor whiteColor];
            _BEMSimpleline.enableTouchReport = YES;
            _BEMSimpleline.colorLine    = [UIColor whiteColor];
            _BEMSimpleline.widthLine    = 3.0;
            [self addSubview:_BEMSimpleline];
            _BEMSimpleline.enableTouchReport = YES;
        }
        
//        传入数据修改的数组再计算
        [self integerPrice];
        _dataArray2 = @[@"12345",@"13345",@"9945",@"15345",@"17345",@"11345",@"19345",];
         [self createPrice];
    }
    return self;
}
-(void)createPrice
{
    _price =[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 150, 20)];
    _price.textColor = [UIColor whiteColor];
    [self addSubview:_price];
    NSArray * array = [[_dateArray reverseObjectEnumerator]allObjects];
    _price.text =[NSString stringWithFormat:@"%@号%@元",[array objectAtIndex:0],[_dataArray2 objectAtIndex:0]];
}
#warning PriceNotData(Price )___________________________________
-(void)integerPrice
{
 
}
-(void)Date
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekdayOrdinal;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    _day = [dateComponent day];
    _monthed = [dateComponent month];
    for (NSInteger i = 0; i < 7; i++)
    {
        NSInteger days =  _day - i;
        [_dateArray addObject:[NSString stringWithFormat:@"%ld",days]];
        if (days <2)
        {
            if (_monthed == 4 || _monthed == 6|| _monthed == 9 || _monthed == 11)
            {
                for (NSInteger j = 0; j <6-i; j++)
                {
                    days = 30;
                    [_dateArray addObject:[NSString stringWithFormat:@"%ld",days-j]];
                    
                }
            }
            if (_monthed == 1|| _monthed == 2 || _monthed == 5|| _monthed == 7 || _monthed == 8|| _monthed == 10 ||_monthed == 12  )
            {
                for (NSInteger j = 0; j <6-i; j++)
                {
                    days = 31;
                    [_dateArray addObject:[NSString stringWithFormat:@"%ld",days-j]];
                    
                }

            }
            if (_monthed == 3)
            {
                for (NSInteger j = 0; j <6-i; j++)
                {
                    days = 28;
                    [_dateArray addObject:[NSString stringWithFormat:@"%ld",days-j]];
                    
                }

            }
           
            
            return;
        }
    }
}

#pragma mark- BEMDelegate
- (int)numberOfPointsInGraph;
{
    
        return (int)[_dataArray2 count];
}
- (float)valueForIndex:(NSInteger)index;
{
    return [[_dataArray2 objectAtIndex:index] floatValue];
}
-(int)numberOfGapsBetweenLabels
{
    return 0;
}
-(NSString *)labelOnXAxisForIndex:(NSInteger)index
{
    NSArray * array = [[_dateArray reverseObjectEnumerator]allObjects];
    return [array objectAtIndex:index];
}
-(void)didTouchGraphWithClosestIndex:(int)index
{
    NSArray * array = [[_dateArray reverseObjectEnumerator]allObjects];
    _price.text =[NSString stringWithFormat:@"%@号%@元",[array objectAtIndex:index],[_dataArray2 objectAtIndex:index]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
