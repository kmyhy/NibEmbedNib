//
//  UIView+loadFromNib.m
//  Client
//
//  Created by qq on 2018/7/31.
//  Copyright © 2018年 qq. All rights reserved.
//

#import "UIView+loadFromNib.h"

@implementation UIView (loadFromNib)
-(UIView*)loadFromNib{
    NSString* nibName = NSStringFromClass([self class]);
    UINib* nib = [UINib nibWithNibName:nibName bundle:nil];
    UIView *view = [nib instantiateWithOwner:self options:nil].lastObject;
    return view;
}
@end
