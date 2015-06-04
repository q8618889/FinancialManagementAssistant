//
//  MultipleTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/12.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "MultipleTableViewCell.h"

@implementation MultipleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createTabel];
    }
    return self;
}
-(void)createTabel
{
    _titles = [[UILabel alloc]initWithFrame:CGRectMake(25, 5, 150, 30)];
    _titles.textColor = BBCOLOR;
    [_titles setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
    [self addSubview:_titles];
    _labOne = [[RTLabel alloc]initWithFrame:CGRectMake(25, 45, MAINSCREEN_WIDTH - 110, 30)];
    [self addSubview:_labOne];
    _labTwo = [[RTLabel alloc]initWithFrame:CGRectMake(25, 75, MAINSCREEN_WIDTH- 110, 30)];
    [self addSubview:_labTwo];
    _labThree = [[RTLabel alloc]initWithFrame:CGRectMake(25, 105, MAINSCREEN_WIDTH-110, 30)];
    [self addSubview:_labThree];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
