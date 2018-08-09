//
//  TestVCViewController.m
//  NibEmbedNib
//
//  Created by qq on 2018/8/9.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "TestViewController.h"
#import "Dashboard.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet Dashboard *dashboard;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TestViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    return self;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _label.text = @"我是一个 Label";
    
    _dashboard.startColor = [UIColor redColor];
    _dashboard.endColor = [UIColor blueColor];
//    [_dashboard setNeedsDisplay];
}


@end
