//
//  FinanclalViewController.h
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinanclalViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView * myTableView;
@end
