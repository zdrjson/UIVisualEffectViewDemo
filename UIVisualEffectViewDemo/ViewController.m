//
//  ViewController.m
//  UIVisualEffectViewDemo
//
//  Created by 张德荣 on 16/4/2.
//  Copyright © 2016年 JsonZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIVisualEffectView *effectView;
@property (nonatomic, strong) UIVisualEffectView *vibrancyEffectView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController
#pragma mark - lazy
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.bounces = NO;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple.jpg"]];
        imageView.frame = self.view.bounds;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.scrollView.contentSize = imageView.image.size;
        [self.scrollView addSubview:imageView];
    }
    return _scrollView;
}
- (UIVisualEffectView *)effectView
{
    if (!_effectView) {
        self.effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        self.effectView.userInteractionEnabled = NO;
        self.effectView.frame = CGRectMake(0, 0, 320, 200);
        self.effectView.center = self.view.center;
        
    }
    return _effectView;
}
- (UIVisualEffectView *)vibrancyEffectView
{
    if (!_vibrancyEffectView) {
        //初始化文本
        UILabel *label = [[UILabel alloc] initWithFrame:self.effectView.bounds];
        label.text = @"objc";
        label.font = [UIFont systemFontOfSize:40.f];
        label.textAlignment = NSTextAlignmentCenter;
        
        //需要与作用的effectView的效果一致
        self.vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)self.effectView.effect]];
        self.vibrancyEffectView.frame = self.effectView.bounds;
        
        //注意,是用的contentView添加label
        [self.vibrancyEffectView.contentView addSubview:label];
        
    }
    return _vibrancyEffectView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加测试用view
    [self.view addSubview:self.scrollView];
    
    // 添加模糊用view
    [self.view addSubview:self.effectView];
    
    //添加额外的view（用contentView）
    [self.effectView.contentView addSubview:self.vibrancyEffectView];
}

@end
