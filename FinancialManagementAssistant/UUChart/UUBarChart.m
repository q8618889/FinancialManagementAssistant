//
//  UUBarChart.m
//  UUChartDemo
//
//  Created by shake on 14-7-24.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//

#import "UUBarChart.h"
#import "UUChartLabel.h"
#import "UUBar.h"

@interface UUBarChart ()
{
    UIView *myScrollView;
    
}
@end

@implementation UUBarChart

- (id)initWithFrame:(CGRect)frame bools:(BOOL)B
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _isThree = B;
        _grades = [NSMutableArray array];
        _barFramX = [NSMutableArray array];
        self.clipsToBounds = YES;
        myScrollView = [[UIView alloc]initWithFrame:CGRectMake(UUYLabelwidth, 0, frame.size.width-UUYLabelwidth, frame.size.height)];
        [self addSubview:myScrollView];
    }
    return self;
}

-(void)setYValues:(NSArray *)yValues
{
    _yValues = yValues;
    [self setYLabels:yValues];
}

-(void)setYLabels:(NSArray *)yLabels
{
    NSInteger max = 0;
    NSInteger min = 1000000000;
    for (NSArray * ary in yLabels) {
        for (NSString *valueString in ary) {
            NSInteger value = [valueString integerValue];
            if (value > max) {
                max = value;
            }
            if (value < min) {
                min = value;
            }
        }
    }
    if (max < 5) {
        max = 5;
    }
    if (self.showRange) {
        _yValueMin = (int)min;
    }else{
        _yValueMin = 0;
    }
    _yValueMax = (int)max;
    
    if (_chooseRange.max!=_chooseRange.min) {
        _yValueMax = _chooseRange.max;
        _yValueMin = _chooseRange.min;
    }

//    float level = (_yValueMax-_yValueMin) /4.0;
//    CGFloat chartCavanHeight = self.frame.size.height - UULabelHeight*3;
//    CGFloat levelHeight = chartCavanHeight /4.0;
//
//    for (int i=0; i<5; i++) {
//        UUChartLabel * label = [[UUChartLabel alloc] initWithFrame:CGRectMake(0.0,chartCavanHeight-i*levelHeight+5, UUYLabelwidth, UULabelHeight)];
//	//	label.text = [NSString stringWithFormat:@"%.1f",level * i+_yValueMin];
//		[self addSubview:label];
//    }
	
}

-(void)setXLabels:(NSArray *)xLabels
{
    _xLabels = xLabels;
    NSInteger num;
    if (xLabels.count>=8) {
        num = 8;
    }else if (xLabels.count<=4){
        num = 4;
    }else{
        num = xLabels.count;
    }
    if (_isThree == YES)
    {
        _xLabelWidth = myScrollView.frame.size.width/num+30;
    }else{
        _xLabelWidth = myScrollView.frame.size.width/num;
    }
    
    
    for (int i=0; i<xLabels.count; i++) {
        UUChartLabel * label = [[UUChartLabel alloc] initWithFrame:CGRectMake((i *  _xLabelWidth )-25, self.frame.size.height - UULabelHeight, _xLabelWidth+30, UULabelHeight-5)];
        label.text = xLabels[i];
        label.font = [UIFont boldSystemFontOfSize:10];
        [myScrollView addSubview:label];
    }
    
    float max = (([xLabels count]-1)*_xLabelWidth + chartMargin)+_xLabelWidth;
    if (myScrollView.frame.size.width < max-10) {
       //myScrollView.contentSize = CGSizeMake(max, self.frame.size.height);
    }
}
-(void)setColors:(NSArray *)colors
{
	_colors = colors;
}
- (void)setChooseRange:(CGRange)chooseRange
{
    _chooseRange = chooseRange;
}
-(void)strokeChart
{
    
    CGFloat chartCavanHeight = self.frame.size.height - UULabelHeight*3;
	
    for (int i=0; i<_yValues.count; i++) {
        if (i==2)
            return;
        NSArray *childAry = _yValues[i];
        for (int j=0; j<childAry.count; j++) {
            NSString *valueString = childAry[j];
            float value = [valueString floatValue];
            float grade = ((float)value-_yValueMin) / ((float)_yValueMax-_yValueMin);
            
            _bar = [[UUBar alloc] initWithFrame:CGRectMake((j+(_yValues.count==1?0.1:0.05))*_xLabelWidth +i*_xLabelWidth * 0.25+15, UULabelHeight, (_xLabelWidth-30) * (_yValues.count==1?0.8:0.25), chartCavanHeight)];
            CGFloat number = (j+(_yValues.count==1?0.1:0.05))*_xLabelWidth +i*_xLabelWidth * 0.25+17;
            [_barFramX addObject:[NSString stringWithFormat:@"%f",number]];
            _bar.barColor = [_colors objectAtIndex:i];
            _bar.grade = grade;
            [_grades addObject:[NSString stringWithFormat:@"%f",_bar.numberGrade]];
            [myScrollView addSubview:_bar];
            
        }
    }
}

@end
