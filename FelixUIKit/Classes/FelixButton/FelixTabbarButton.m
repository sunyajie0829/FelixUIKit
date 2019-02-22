//
//  FelixTabbarButton.m
//  FelixUIKit
//
//  Created by weistek on 2019/2/18.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "FelixTabbarButton.h"

@implementation FelixTabbarButton
- (instancetype)initWithImg:(UIImage *)img selImg:(UIImage *)selImg title:(NSString *)title titleColor:(UIColor *)titleColor  selTitleColor:(UIColor *)selTitleColor titleFont:(UIFont *)font{
    if (self == [super init]){
        [self setImage:img forState:UIControlStateNormal];
        [self setImage:selImg forState:UIControlStateSelected];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateSelected];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self setTitleColor:selTitleColor forState:UIControlStateSelected];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = font;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.minimumScaleFactor = 0.1;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGRect rect = contentRect;
    rect.origin.y = contentRect.size.height * (_imgRatio + _paddingTopRatio);
    rect.size.height = contentRect.size.height * (1 - _imgRatio - _paddingTopRatio);
    return rect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect rect = contentRect;
    rect.size.height = contentRect.size.height * _imgRatio;
    rect.size.width = contentRect.size.height * _imgRatio;
    rect.origin.x = (contentRect.size.width - rect.size.width)/2;
    rect.origin.y = contentRect.size.height * _paddingTopRatio;
    return rect;
}
@end
