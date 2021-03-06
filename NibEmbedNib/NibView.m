//
//  NibView.m
//  NibEmbedNib
//
//  Created by qq on 2018/8/8.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "NibView.h"

@interface NibView()
@property (strong, nonatomic) UIView *view;

@end

@implementation NibView

// MARK: - initialize
-(UIView*)loadViewFromNib{
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    UINib* nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:bundle];
    
    UIView *view = (UIView*)[nib instantiateWithOwner:self options:nil][0];
    
    return view;
}
-(void)xibSetup{
    self.view = [self loadViewFromNib];
    
    // use bounds not frame or it'll be offset
    self.view.frame = self.bounds;
    
    // Make the view stretch with containing view
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:self.view];
}
-(instancetype)initWithFrame:(CGRect)frame{
    // 1. setup any properties here
    
    // 2. call super.init(frame:)
    self = [super initWithFrame: frame];
    
    // 3. Setup view from .xib file
    [self xibSetup];
    
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    // 1. setup any properties here
    
    // 2. call super.init(coder:)
    self = [super initWithCoder:aDecoder];
    
    // 3. Setup view from .xib file
    [self xibSetup];
    
    return self;
}

@end
