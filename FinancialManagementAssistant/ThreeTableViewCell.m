//
//  ThreeTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "ThreeTableViewCell.h"

@implementation ThreeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {

        _labs  = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 60, 20)];
        _labs.text = @"近七日";
        _labs.font = [UIFont boldSystemFontOfSize:13];
        _labs.textColor = BCOLOR;
        [self addSubview:_labs];
        [self createLabel];
    }
    return self;
}
-(void)createLabel
{
    if (isRetina||iPhone5)
    {
        _TBargain = [[RTLabel alloc]initWithFrame:CGRectMake(20, 45, 240, 30)];
        [self addSubview:_TBargain];
        _TPrice   = [[RTLabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-60, 40, 60, 30)];
        [self addSubview:_TPrice];
    }
    
    if (iPhone6||iPhone6P)
    {
        _TBargain = [[RTLabel alloc]initWithFrame:CGRectMake(20, 45, 240, 30)];
        [self addSubview:_TBargain];
        _TPrice   = [[RTLabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-80, 40, 60, 30)];
        [self addSubview:_TPrice];
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
