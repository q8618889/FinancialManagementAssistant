//
//  VIPSTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/12.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "VIPSTableViewCell.h"

@implementation VIPSTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createLabel];
    }
    return self;
}
-(void)createLabel
{
    UILabel * VIPNumber = [[UILabel alloc]initWithFrame:CGRectMake(25, 10, 150, 30)];
    VIPNumber.text = @"会员数";
    VIPNumber.textColor = BBCOLOR;
    [VIPNumber setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
    [self addSubview:VIPNumber];
    _NewRegistration = [[RTLabel alloc]initWithFrame:CGRectMake(25, 40, MAINSCREEN_WIDTH - 120 , 30)];
    [self addSubview:_NewRegistration];
    _VIPMembers      = [[RTLabel alloc]initWithFrame:CGRectMake(25, 65, MAINSCREEN_WIDTH - 120, 30)];
    [self addSubview:_VIPMembers];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
