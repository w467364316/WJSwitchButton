//
//  WJSwitchView.m
//  UISwitchDemo
//
//  Created by iMac-jianjian on 16/6/27.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "WJSwitchView.h"


@interface WJSwitchView (){

    BOOL isOpen;//是否开启(右边为开启)

}

@property(nonatomic,strong) UIImageView  * bgView;//背景图片

@property(nonatomic,strong) UIImageView  * btnView;//按钮图片

@property(nonatomic,assign) CGFloat beginpoint;//开始的位置

@end

@implementation WJSwitchView


-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag delegate:(id)delegate{

    
    if (self = [super initWithFrame:frame]) {
        
        [self setFrame:frame];
        [self setBtnImageView];
        self.tag = tag;
        self.delegate = delegate;
    }
    return self;
}

/**
 *  设置按钮背景图片
 */
-(void)setBtnImageView{
    
    //设置背景图片
    self.bgView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.bgView setImage:[UIImage imageNamed:@"bgViewOff"]];
    [self addSubview:self.bgView];
    
    isOpen = NO;
    
    //设置按钮图片
    self.btnView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)-4)];
    [self.btnView setImage:[UIImage imageNamed:@"switchBtn"]];
    [self addSubview:self.btnView];
}

//触摸方法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    UITouch * touch = [touches anyObject];
    self.beginpoint = [touch locationInView:self].x;
    
    if (!isOpen) {
        [self switchOpen];
        isOpen = YES;
  
    }else{
        
        [self switchClose];
        isOpen = NO;
        
    }
    
    //实现协议方法
    if (self.delegate  && [self.delegate respondsToSelector:@selector(WJSwitchViewDelegateWithSwitchStates: withTag:)]) {
        [self.delegate WJSwitchViewDelegateWithSwitchStates:isOpen withTag:self.tag];
    }
    
}

/**
 *  开启
 */
-(void)switchOpen{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.bgView setImage:[UIImage imageNamed:@"bgViewOn"]];
    });
    
    CGFloat X = CGRectGetWidth(self.frame)/2;
    CGRect frame = self.btnView.frame;
    
    
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         [self.btnView setFrame:CGRectMake(X, frame.origin.y, frame.size.width, frame.size.height)];
    } completion:^(BOOL finished) {
        
    }];
}

/**
 *  关闭
 */
-(void)switchClose{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.bgView setImage:[UIImage imageNamed:@"bgViewOff"]];
    });
    
    
    CGFloat X = 2;
    CGRect frame = self.btnView.frame;
    
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         [self.btnView setFrame:CGRectMake(X, frame.origin.y, frame.size.width, frame.size.height)];
    } completion:^(BOOL finished) {
        
    }];

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
