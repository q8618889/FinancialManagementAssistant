//
//  LoginViewController.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/12.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNav];
}
-(void)createNav
{
    
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 64+40)];
    image.userInteractionEnabled = YES;
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH/2-50, 20, 150, 40)];
    lab.text  =@"年度财务统计";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont boldSystemFontOfSize:18.0];
    image.backgroundColor = BCOLOR;
    [image addSubview:lab];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
