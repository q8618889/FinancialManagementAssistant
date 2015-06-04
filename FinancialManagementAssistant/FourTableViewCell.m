//
//  FourTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "FourTableViewCell.h"

@implementation FourTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:113.0/255.0 green:198.0/255.0 blue:232.0/255.0 alpha:1.0];
        _titles = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-35, 2, 100, 40)];
        [self addSubview:_titles];
        _pushButton = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-30, 10, 25, 25)];
        _pushButton.image = [UIImage imageNamed:@"button_png.png"];
        [self addSubview:_pushButton];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
