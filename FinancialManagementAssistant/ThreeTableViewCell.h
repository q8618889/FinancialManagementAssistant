//
//  ThreeTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"
@interface ThreeTableViewCell : UITableViewCell
//参考OneCell
@property (nonatomic,retain)RTLabel         * TBargain;
@property (nonatomic,retain)UILabel         * labs;
@property (nonatomic,retain)RTLabel         * TPrice;


@end
