//
//  PFTableViewCell.m
//  FinancialManagementAssistant
//
//  Created by MAXMFJ on 15/2/11.
//  Copyright (c) 2015年 Boxer. All rights reserved.
//

#import "PFTableViewCell.h"

@implementation PFTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = BBCOLOR;
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self createButton];
        [self createLine];
    }
    return self;
}
//图解 图标
-(void)createButton
{
    _Rlabel= [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 160, 15)];
    _Rlabel.textColor = [UIColor whiteColor];
    _Rlabel.font = [UIFont boldSystemFontOfSize:13];
    [self addSubview:_Rlabel];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(30, 20,120 ,15)];
    lab.text = @"(点击图标查看详情)";
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont boldSystemFontOfSize:13];
    [self addSubview:lab];
    UIView * viewOne = [[UIView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-200 , 8, 15, 15)];
    viewOne.backgroundColor = [UIColor whiteColor];
    [self addSubview:viewOne];
    UIView * viewTwo = [[UIView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-130 , 8, 15, 15)];
    viewTwo.backgroundColor = BCCOLOR;
    [self addSubview:viewTwo];
    UIView * viewThree = [[UIView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-200 , 8+15+3, 15, 15)];
    viewThree.backgroundColor = BCOLOR;
    [self addSubview:viewThree];
    UIView * viewFour = [[UIView alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-130 , 8+15+3, 15, 15)];
    viewFour.backgroundColor = BBCCOLOR;
    [self addSubview:viewFour];
    UILabel * labs = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-185, 4, MAINSCREEN_WIDTH-170-5, 25)];
    labs.text = @" 成人调理           儿童调理    元/月";
    labs.textColor = [UIColor whiteColor];
    labs.font = [UIFont boldSystemFontOfSize:10];
    [self addSubview:labs];
    UILabel * labes = [[UILabel alloc]initWithFrame:CGRectMake(MAINSCREEN_WIDTH-185, 4+18, MAINSCREEN_WIDTH-170-5, 25)];
    labes.text = @" 中药理疗           特色理疗";
    labes.textColor = [UIColor whiteColor];
    labes.font = [UIFont boldSystemFontOfSize:10];
    [self addSubview:labes];
    //    页面push 的按钮
    _Fbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    _Fbutton.frame = CGRectMake(170, 10, MAINSCREEN_WIDTH-170-5 , 25);
    [self addSubview:_Fbutton];
    
    
}
-(void)createLine
{
    //    创建线的View路径
    SHLineGraphView * _lineGraph  = [[SHLineGraphView alloc]initWithFrame:CGRectMake(0, 40,MAINSCREEN_WIDTH,200-40)];
    [self addSubview:_lineGraph];
    NSDictionary *_themeAttributes = @{
                                       kXAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelSideMarginsKey : @20,
                                       kPlotBackgroundLineColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kDotSizeKey : @10
                                       };
    _lineGraph.themeAttributes = _themeAttributes;
    _lineGraph.yAxisRange = @(100);
    _lineGraph.xAxisValues = @[
                               @{ @1 : @"1" },
                               @{ @2 : @"2" },
                               @{ @3 : @"3" },
                               @{ @4 : @"4" },
                               @{ @5 : @"5" },
                               @{ @6 : @"6" },
                               @{ @7 : @"7" },
                               @{ @8 : @"8" },
                               @{ @9 : @"9" },
                               @{ @10 : @"10" },
                               @{ @11 : @"11" },
                               @{ @12 : @"12" }
                               ];
    
    //    创建线
    SHPlot *_plot1 = [[SHPlot alloc] init];
    SHPlot *_plot2 = [[SHPlot alloc] init];
    SHPlot *_plot3 = [[SHPlot alloc] init];
    SHPlot *_plot4 = [[SHPlot alloc] init];
    _plot1.plottingValues = @[
                              @{ @1 : @25.8 },
                              @{ @2 : @15.8 },
                              @{ @3 : @75.8 },
                              @{ @4 : @85.8 },
                              @{ @5 : @15.8 },
                              @{ @6 : @25.8 },
                              @{ @7 : @45.8 },
                              @{ @8 : @95.8 },
                              @{ @9 : @25.8 },
                              @{ @10 : @55.8 },
                              @{ @11 : @45.8 },
                              @{ @12 : @65.8 },
                              ];
    _plot2.plottingValues = @[
                              @{ @1 : @15.8 },
                              @{ @2 : @"23" },
                              @{ @3 : @21 },
                              @{ @4 : @2 },
                              @{ @5 : @12.3 },
                              @{ @6 : @15.8 },
                              @{ @7 : @26 },
                              @{ @8 : @47 },
                              @{ @9 : @65 },
                              @{ @10 : @70 },
                              @{ @11 : @87 },
                              @{ @12 : @93 }
                              ];
    _plot3.plottingValues = @[
                              @{ @1 : @15 },
                              @{ @2 : @29 },
                              @{ @3 : @30 },
                              @{ @4 : @39 },
                              @{ @5 : @52.3 },
                              @{ @6 : @45.8 },
                              @{ @7 : @20 },
                              @{ @8 : @89 },
                              @{ @9 : @63 },
                              @{ @10 : @40 },
                              @{ @11 : @90 },
                              @{ @12 : @10 }
                              ];
    _plot4.plottingValues = @[
                              @{ @1 : @25 },
                              @{ @2 : @39 },
                              @{ @3 : @40 },
                              @{ @4 : @59 },
                              @{ @5 : @22 },
                              @{ @6 : @15 },
                              @{ @7 : @60 },
                              @{ @8 : @49 },
                              @{ @9 : @13 },
                              @{ @10 : @50 },
                              @{ @11 : @40 },
                              @{ @12 : @90 }
                              ];

    NSArray *arr = @[@"65",
                     @"20",
                     @"23",
                     @"22",
                     @"99",
                     @"45",
                     @"56",
                     @"97",
                     @"65",
                     @"10",
                     @"67",
                     @"23"];
    NSArray *arr1 = @[@"15",
                      @"23",
                      @"21",
                      @"2",
                      @"12",
                      @"15",
                      @"26",
                      @"47",
                      @"65",
                      @"70",
                      @"87",
                      @"93"];
    NSArray *arr2 = @[@"15",
                      @"29",
                      @"30",
                      @"39",
                      @"52",
                      @"45",
                      @"20",
                      @"89",
                      @"63",
                      @"40",
                      @"90",
                      @"10"];
    NSArray *arr3 = @[@"25",
                      @"39",
                      @"40",
                      @"59",
                      @"22",
                      @"15",
                      @"60",
                      @"49",
                      @"13",
                      @"50",
                      @"40",
                      @"90"];
    _plot1.plottingPointsLabels = arr;
    _plot2.plottingPointsLabels = arr1;
    _plot3.plottingPointsLabels = arr2;
    _plot4.plottingPointsLabels = arr3;
    
    //set plot theme attributes
    
    /**
     *  the dictionary which you can use to assing the theme attributes of the plot. if this property is nil, a default theme
     *  is applied selected and the graph is plotted with those default settings.
     */
    
    NSDictionary *_plotThemeAttributes = @{
                                           kPlotFillColorKey : [UIColor clearColor],
                                           kPlotStrokeWidthKey : @2,
                                           kPlotStrokeColorKey : [UIColor whiteColor],
                                           kPlotPointFillColorKey : [UIColor clearColor],
                                           kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                                           };
    NSDictionary *_plotThemeAttributes2 = @{
                                            kPlotFillColorKey : [UIColor clearColor],
                                            kPlotStrokeWidthKey : @2,
                                            kPlotStrokeColorKey : BCOLOR,
                                            kPlotPointFillColorKey : [UIColor clearColor],
                                            kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                                            };
    NSDictionary *_plotThemeAttributes3 = @{
                                            kPlotFillColorKey : [UIColor clearColor],
                                            kPlotStrokeWidthKey : @2,
                                            kPlotStrokeColorKey : BCCOLOR,
                                            kPlotPointFillColorKey : [UIColor clearColor],
                                            kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                                            };
    NSDictionary *_plotThemeAttributes4 = @{
                                            kPlotFillColorKey : [UIColor clearColor],
                                            kPlotStrokeWidthKey : @2,
                                            kPlotStrokeColorKey : BBCCOLOR,
                                            kPlotPointFillColorKey : [UIColor clearColor],
                                            kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                                            };
    
    _plot1.plotThemeAttributes = _plotThemeAttributes;
    _plot2.plotThemeAttributes = _plotThemeAttributes2;
    _plot3.plotThemeAttributes = _plotThemeAttributes3;
    _plot4.plotThemeAttributes = _plotThemeAttributes4;
    [_lineGraph addPlot:_plot1];
    [_lineGraph addPlot:_plot2];
    [_lineGraph addPlot:_plot3];
    [_lineGraph addPlot:_plot4];
    
    //You can as much `SHPlots` as you can in a `SHLineGraphView`
    [_lineGraph setupTheView];
    
    [self addSubview:_lineGraph];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
