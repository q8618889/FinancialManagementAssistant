//
//  EarningsTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/5.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EColumnDataModel.h"
#import "EColumnChartLabel.h"
#import "EFloatBox.h"
#import "EColor.h"
#import "EColumn.h"
#import "EColumnChart.h"
#include <stdlib.h>
@interface EarningsTableViewCell : UITableViewCell<EColumnChartDataSource,EColumnChartDelegate>
@property (nonatomic,strong)EColumn       *eColumnSelected;
@property (nonatomic,strong)EColumnChart  *eColumnChart;
@property (nonatomic,strong)UILabel       *labOne;
@property (nonatomic,strong)UILabel       *labTwo;
@property (nonatomic,strong)UILabel       *labThree;
@property (nonatomic,strong)RTLabel       *Ylab;
@end
