//
//  ViewController.m
//  FinancialManagementAssistant
//
//  Created by Boxer on 15/2/3.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "ViewController.h"
#import "RetallViewController.h"
#import "FinanclalViewController.h"
#import "ProjectAViewController.h"
#import "VIPViewController.h"
@interface ViewController ()
{
    CGFloat _width;
    CGFloat _height;
    NSArray     * _labArray;
    NSArray     * _selectedArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;

    UIView * views  = [[UIView alloc]initWithFrame:self.view.frame];
    views.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:views];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((MAINSCREEN_WIDTH-223)/2, 200, 223, 109)];
    imageView.image = [UIImage imageNamed:@"logo@3x.png"];
    [views addSubview:imageView];
    [UIView animateWithDuration:2 animations:^
     {
         imageView.alpha = 0.9;
     } completion:^(BOOL finished)
     {
         [UIView transitionWithView:self.view.window duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:nil];
         [views removeFromSuperview];
         [self createTableBar];
     }];
//   创建TableBar底部视图
    
}
-(void)createTableBar
{
    FinanclalViewController * financlal = [[FinanclalViewController alloc]init];
    UINavigationController  * fNav    = [[UINavigationController alloc]initWithRootViewController:financlal];
    RetallViewController * retallAniysis = [[RetallViewController alloc]init];
    UINavigationController  * nav = [[UINavigationController alloc]initWithRootViewController:retallAniysis];
    ProjectAViewController  * project = [[ProjectAViewController alloc]init];
    UINavigationController  * pNav    = [[UINavigationController alloc]initWithRootViewController:project];
    VIPViewController       * Vip     = [[VIPViewController alloc]init];
    UINavigationController  * VNav    = [[UINavigationController alloc]initWithRootViewController:Vip];
    _VCArray = @[fNav,nav,pNav,VNav];
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
    _myTable =[[UIView alloc] initWithFrame:CGRectMake(0, screenHeight-49, screenWidth, 49)];
    _myTable.tag = 777;
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 49)];
    image.image = [UIImage imageNamed:@"myTabelBar.png"];
    [_myTable addSubview:image];
    [[UIApplication sharedApplication].delegate.window addSubview:_myTable];
    NSInteger count=[_VCArray count];
    CGFloat width=screenWidth/count;
    _labArray = @[@"2_02.png",@"2_03.png",@"2_04.png",@"2_05.png"];
    _selectedArray = @[@"01首页财务统计_02.png",@"01首页财务统计_03.png",@"01首页财务统计_04.png",@"01首页财务统计_05.png"];
    for (int i=0; i<4; i++) {

        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(width*i, 0, width, 49);
        button.tag=i;
        UIImage * Nimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[_labArray objectAtIndex:i]]];
        UIImage * Simage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[_selectedArray objectAtIndex:i]]];
        [Nimage stretchableImageWithLeftCapWidth:Nimage.size.width/2 topCapHeight:Nimage.size.height/2];
        [Simage stretchableImageWithLeftCapWidth:Simage.size.width/2 topCapHeight:Simage.size.height/2];
        [button setImage:Nimage forState:0];
        [button setImage:Simage forState:UIControlStateSelected];
        
        button.adjustsImageWhenHighlighted = NO;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_myTable addSubview:button];
        
        if (i==0) {
            [self buttonClick:button];
        }
        
    }
    
}
-(void)buttonClick:(UIButton *)btn{
    _button_TabelBar.selected=NO;
    btn.selected=YES;
    _button_TabelBar=btn;
    UIViewController *vc=_VCArray[btn.tag];
    if ([self.view.subviews containsObject:vc.view]) {
        [self.view bringSubviewToFront:vc.view];
    }else{
        [self.view addSubview:vc.view];
        
    }
    UIView * view = [[UIApplication sharedApplication].delegate.window.rootViewController.view viewWithTag:10001];
    
    [view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
