//
//  XLineTableViewCell.h
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/10.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLineTableViewCell : UITableViewCell<BEMSimpleLineGraphDelegate>
- (instancetype)initWithYear:(NSString *)year;
@property (nonatomic,retain)NSArray          * dataArray;
@property (nonatomic,retain)NSString                * year;
@property (nonatomic,retain)BEMSimpleLineGraphView  * BEMSimplelines;
@property (nonatomic,retain)UILabel                 * price;





@end
