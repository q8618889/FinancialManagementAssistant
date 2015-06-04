//
//  RetallViewController.h
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RetallViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain)UITableView     *myTableView;
@property (nonatomic,retain)NSString         *YYLabel;
@end
