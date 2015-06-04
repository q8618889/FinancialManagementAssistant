//
//  PHTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/11.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UUChart.h"
@interface PHTableViewCell : UITableViewCell<UUChartDataSource>
@property (nonatomic,strong)UILabel       *labOne;
@property (nonatomic,strong)UILabel       *labTwo;
@property (nonatomic,strong)UILabel       *labThree;
@property (nonatomic,strong)UILabel       *labFour;
@property (nonatomic,strong)UILabel       *labFive;
@property (nonatomic,strong)UILabel       *labSix;
@property (nonatomic,strong)UILabel       *labSeven;
@property (nonatomic,strong)UILabel       *labEight;
@end
