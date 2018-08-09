//
//  Dashboaard.m
//  Dashboard
//
//  Created by qq on 2016/12/1.
//  Copyright © 2016年 qq. All rights reserved.
//

#import "Dashboard.h"
#import "UIColor+Interpolate.h"

@interface Dashboard(){
    CGPoint center;
}
@end

@implementation Dashboard


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setupDashboard];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupDashboard];
    }
    return self;
}
-(instancetype)init{
    CGRect rect = CGRectMake(0, 0, 220, 220);
    self = [self initWithFrame:rect];
    return self;
}
-(void)setupDashboard{
    _startColor = [UIColor blueColor];
    _endColor = [UIColor greenColor];
    _defaultColor = [UIColor lightGrayColor];
    _dangerColor = [UIColor redColor];
    _markWidth = 2.5;
    _markLength = 23;
    _dangerValue = 0.1;
    _value = 1;
    self.backgroundColor = [UIColor clearColor];
    
    _minMarkColor = [UIColor lightGrayColor];
    _minMarkWidth = 1.5;
    _minMarkLength = 3;
    
    _startDegree = 45;
    _endDegree = 315;
}

-(void)drawRect:(CGRect)rect{
    CGFloat radius = rect.size.width/2;
    center = CGPointMake(radius,radius);
    UIColor *color = nil;//_defaultColor;
    CGFloat span = _endDegree-_startDegree;
    CGFloat degree = span*_value;// percent covert to 0-270 degrees.
    for(int i = 0;i<=span;i+=5){
        
        if( i > degree){
            color = _defaultColor;
        }else{
            if( _value <= _dangerValue ){
                color = _dangerColor;
            }else{
                CGFloat location = i/span;// degree conver to 0-1 percent.
                color = [UIColor colorBetweenColor:_startColor andColor:_endColor atLocation:location];
            }
        }
        [self drawMarkAt:i+_startDegree radius:radius color:color];
        //        NSLog(@"%d",i);
        
        CGFloat minMarkRadius = radius - _markLength - _markLength/2 - _minMarkLength;
        [self drawMinMarkAt:i+_startDegree radius:minMarkRadius color:_minMarkColor];
    }
}

-(void)drawMarkAt:(CGFloat)degree radius:(CGFloat)radius color:(UIColor*)color{
    
    //    NSLog(@"%.0f,%@",degree,color);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, center.x, center.y);
    
    CGContextRotateCTM(context, (degree-90) * M_PI / 180);
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(-radius, -0)];
    [bezierPath addLineToPoint: CGPointMake(_markLength-radius, 0)];
    bezierPath.lineCapStyle = kCGLineCapRound;
    
    [color setStroke];
    bezierPath.lineWidth = _markWidth;
    [bezierPath stroke];
    
    CGContextRestoreGState(context);
    
}

-(void)drawMinMarkAt:(CGFloat)degree radius:(CGFloat)radius color:(UIColor*)color{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, center.x, center.y);
    
    CGContextRotateCTM(context, (degree-90) * M_PI / 180);
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(-radius, -0)];
    [bezierPath addLineToPoint: CGPointMake(_minMarkLength-radius, 0)];
    bezierPath.lineCapStyle = kCGLineCapRound;
    
    [_minMarkColor setStroke];
    bezierPath.lineWidth = _minMarkWidth;
    [bezierPath stroke];
    
    CGContextRestoreGState(context);
    
}

// MARK: - getter/setter
-(void)setMarkLength:(CGFloat)value{
    _markLength=value;
    [self setNeedsDisplay];
}
-(void)setMarkWidth:(CGFloat)value{
    _markWidth=value;
    [self setNeedsDisplay];
}
-(void)setStartColor:(UIColor*)value{
    _startColor=value;
    [self setNeedsDisplay];
}
-(void)setEndColor:(UIColor*)value{
    _endColor=value;
    [self setNeedsDisplay];
}
-(void)setDefaultColor:(UIColor*)value{
    _defaultColor=value;
    [self setNeedsDisplay];
}
-(void)setDangerColor:(UIColor*)value{
    _dangerColor=value;
    [self setNeedsDisplay];
}
-(void)setValue:(CGFloat)value{
    _value=value;
    [self setNeedsDisplay];
}
-(void)setDangerValue:(CGFloat)value{
    _dangerValue=value;
    [self setNeedsDisplay];
}
-(void)setMinMarkLength:(CGFloat)value{
    _minMarkLength=value;
    [self setNeedsDisplay];
}
-(void)setMinMarkWidth:(CGFloat)value{
    _minMarkWidth = value;
}
-(void)setMinMarkColor:(UIColor*)value{
    _minMarkColor=value;
    [self setNeedsDisplay];
}
-(void)setStartDegree:(CGFloat)startDegree{
    _startDegree = startDegree;
    [self setNeedsDisplay];
}
-(void)setEndDegree:(CGFloat)endDegree{
    _endDegree = endDegree;
    [self setNeedsDisplay];
}
@end
