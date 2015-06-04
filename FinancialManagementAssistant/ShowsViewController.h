//
//  ShowsViewController.h
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/10.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSString * year;
@end
