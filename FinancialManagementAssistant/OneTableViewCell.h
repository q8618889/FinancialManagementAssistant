//
//  OneTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"
@interface OneTableViewCell : UITableViewCell
//今日时间日期
@property (nonatomic,retain)RTLabel         * lab_Today;
//当前价钱
@property (nonatomic,retain)RTLabel         * lab_Price;
//成交数量
@property (nonatomic,retain)RTLabel         * lab_Bargain;
//退订数量
@property (nonatomic,retain)RTLabel         * lab_Countermand;
//退单率
@property (nonatomic,retain)RTLabel         * lab_Percent;
@end
