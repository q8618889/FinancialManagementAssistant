//
//  OneTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "OneTableViewCell.h"

@implementation OneTableViewCell
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createLable];
    }
    return self;
}
-(void)createLable
{
    if (isRetina||iPhone5)
    {
        _lab_Today = [[RTLabel alloc]initWithFrame:CGRectMake(10, 10, 150, 20)];
        [self addSubview:_lab_Today];
        
        _lab_Price = [[RTLabel alloc] initWithFrame:CGRectMake(50, 48, 120, 60)];
        [self addSubview:_lab_Price];
        _lab_Bargain = [[RTLabel alloc]initWithFrame:CGRectMake(170, 30, 150, 35)];
        [self addSubview:_lab_Bargain];
        _lab_Countermand = [[RTLabel alloc]initWithFrame:CGRectMake(170, 65, 170, 35)];
        [self addSubview:_lab_Countermand];
    }
    if (iPhone6)
    {
        _lab_Today = [[RTLabel alloc]initWithFrame:CGRectMake(10, 10, 150, 20)];
        [self addSubview:_lab_Today];
        
        _lab_Price = [[RTLabel alloc] initWithFrame:CGRectMake(70, 48, 120, 60)];
        [self addSubview:_lab_Price];
        _lab_Bargain = [[RTLabel alloc]initWithFrame:CGRectMake(205, 30, 150, 35)];
        [self addSubview:_lab_Bargain];
        _lab_Countermand = [[RTLabel alloc]initWithFrame:CGRectMake(205, 65, 170, 35)];
        [self addSubview:_lab_Countermand];

    }
    if (iPhone6P)
    {
        _lab_Today = [[RTLabel alloc]initWithFrame:CGRectMake(10, 10, 150, 20)];
        [self addSubview:_lab_Today];
        
        _lab_Price = [[RTLabel alloc] initWithFrame:CGRectMake(70, 48, 120, 60)];
        [self addSubview:_lab_Price];
        _lab_Bargain = [[RTLabel alloc]initWithFrame:CGRectMake(245, 30, 150, 35)];
        [self addSubview:_lab_Bargain];
        _lab_Countermand = [[RTLabel alloc]initWithFrame:CGRectMake(245, 65, 170, 35)];
        [self addSubview:_lab_Countermand];
    }
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
