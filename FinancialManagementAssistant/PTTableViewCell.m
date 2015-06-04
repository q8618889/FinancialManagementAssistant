//
//  PTTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/11.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "PTTableViewCell.h"

@implementation PTTableViewCell
{
     NSArray *  _retallArray;
}

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = BBCOLOR;
        _retallArray = [[NSArray alloc]initWithObjects:@"成人调理",@"儿科调理",@"中药理疗",@"特色理疗",nil];
        [self PnpieChart];
        [self createLabel];
        // self.changeValueButton.hidden = YES;
    }
    return self;
}
-(void)PnpieChart
{
    if (isRetina || iPhone5)
    {
        NSArray *items = @[[PNPieChartDataItem dataItemWithValue:220 color:BCCOLOR],
                           [PNPieChartDataItem dataItemWithValue:180 color:BCOLOR description:@""],
                           [PNPieChartDataItem dataItemWithValue:260 color:BBCCOLOR description:@""],
                           [PNPieChartDataItem dataItemWithValue:130 color:[UIColor whiteColor] description:@""],
                           ];
        self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(5,0, 150.0, 150.0) items:items];
        self.pieChart.descriptionTextColor = [UIColor clearColor];
        self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
        self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
        [self.pieChart strokeChart];
        
        
        [self addSubview:self.pieChart];
        
    }else{
        NSArray *items = @[[PNPieChartDataItem dataItemWithValue:220 color:BCCOLOR],
                           [PNPieChartDataItem dataItemWithValue:180 color:BCOLOR description:@""],
                           [PNPieChartDataItem dataItemWithValue:260 color:BBCCOLOR description:@""],
                           [PNPieChartDataItem dataItemWithValue:130 color:[UIColor whiteColor] description:@""]
                           ];
        self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(20,0, 150.0, 150.0) items:items];
        self.pieChart.descriptionTextColor = [UIColor clearColor];
        self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
        self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
        [self.pieChart strokeChart];
        [self addSubview:self.pieChart];
    }
}
-(void)createLabel
{
    if (isRetina || iPhone5)
    {
        int Yj = 100/4;
        for (int i = 0; i<4 ; i++)
        {
            UIView * view = [[UIView alloc]initWithFrame:CGRectMake(150, Yj+i*30, 15, 15)];
            if (i == 0)
            {
                view.backgroundColor = [UIColor whiteColor];
            }
            if (i== 1)
            {
                view.backgroundColor = [UIColor colorWithRed:190.0/255.0 green:238.0/255.0 blue:255.0/255.0 alpha:1.0];
            }
            if (i == 2)
            {
                view.backgroundColor = BCOLOR;
            }
            view.layer.cornerRadius = 15/2;
            [self addSubview:view];
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(170, Yj+i*30-3, 150, 20)];
            if (i == 0)
            {
                lab.text  = [NSString stringWithFormat:@"%@  %@",[_retallArray objectAtIndex:i],[_pieChart.PNumber objectAtIndex:2]];
            }
            if (i == 1)
            {
                
                lab.text  = [NSString stringWithFormat:@"%@     %@",[_retallArray objectAtIndex:i],[_pieChart.PNumber objectAtIndex:0]];
            }
            
            if (i ==2)
            {
                lab.text  = [NSString stringWithFormat:@"%@     %@",[_retallArray objectAtIndex:i],[_pieChart.PNumber objectAtIndex:1]];
            }
            lab.textColor = [UIColor whiteColor];
            lab.font = [UIFont boldSystemFontOfSize:13];
            [self addSubview:lab];
        }
        
        UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(55, 55, 50, 20)];
        lab.font = [UIFont boldSystemFontOfSize:13];
        lab.text = @"总收益";
        lab.textColor = [UIColor whiteColor];
        [self addSubview:lab];
        UILabel * numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 75, 100, 20)];
        numberLabel.textAlignment   = NSTextAlignmentCenter;
        numberLabel.font = [UIFont boldSystemFontOfSize:13];
        numberLabel.text = @"216,5032";
        numberLabel.textColor = [UIColor whiteColor];
        [self addSubview:numberLabel];
    }else{
        int Yj = 100/4;
        for (int i = 0; i<4 ; i++)
        {
            UIView * view = [[UIView alloc]initWithFrame:CGRectMake(180, Yj+i*30, 15, 15)];
            if (i == 0)
            {
                view.backgroundColor = [UIColor whiteColor];
            }
            if (i== 1)
            {
                view.backgroundColor = [UIColor colorWithRed:190.0/255.0 green:238.0/255.0 blue:255.0/255.0 alpha:1.0];
            }
            if (i == 2)
            {
                view.backgroundColor = BCOLOR;
            }
            if (i == 3)
            {
                view.backgroundColor = BBCCOLOR;
            }
            view.layer.cornerRadius = 15/2;
            [self addSubview:view];
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(200, Yj+i*30-3, 150, 20)];
            if (i == 0)
            {
                lab.text  = [NSString stringWithFormat:@"%@    %@",[_retallArray objectAtIndex:i],[_pieChart.PNumber objectAtIndex:2]];
            }
            if (i == 1)
            {
                
                lab.text  = [NSString stringWithFormat:@"%@     %@",[_retallArray objectAtIndex:i],[_pieChart.PNumber objectAtIndex:0]];
            }
            
            if (i ==2)
            {
                lab.text  = [NSString stringWithFormat:@"%@     %@",[_retallArray objectAtIndex:i],[_pieChart.PNumber objectAtIndex:1]];
            }
            if(i == 3)
            {
                lab.text = [NSString stringWithFormat:@"%@      %@",[_retallArray objectAtIndex:i],[_pieChart.PNumber objectAtIndex:3]];
            }
            lab.textColor = [UIColor whiteColor];
            lab.font = [UIFont boldSystemFontOfSize:13];
            [self addSubview:lab];
        }
        
        UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(75, 55, 50, 20)];
        lab.font = [UIFont boldSystemFontOfSize:13];
        lab.text = @"总收益";
        lab.textColor = [UIColor whiteColor];
        [self addSubview:lab];
        UILabel * numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(45, 75, 100, 20)];
        numberLabel.textAlignment   = NSTextAlignmentCenter;
        numberLabel.font = [UIFont boldSystemFontOfSize:13];
        numberLabel.text = @"216,5032";
        numberLabel.textColor = [UIColor whiteColor];
        [self addSubview:numberLabel];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
