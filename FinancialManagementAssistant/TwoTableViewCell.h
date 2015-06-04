//
//  TwoTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"BEMSimpleLineGraphView.h"
@interface TwoTableViewCell : UITableViewCell<BEMSimpleLineGraphDelegate>

@property (nonatomic,retain)UILabel         *price;
@property (nonatomic,retain)UILabel         *Dates;
@end
