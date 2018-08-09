//
//  ViewController.m
//  NibEmbedNib
//
//  Created by qq on 2018/8/8.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "TestViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MyView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_myView.button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)buttonClicked{
    [self performSegueWithIdentifier:@"test" sender:nil];
    
//    TestViewController* vc = [TestViewController new];
//
//    [self.navigationController pushViewController:vc animated:YES];
//
}

@end
