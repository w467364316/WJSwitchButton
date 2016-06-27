//
//  WJSwitchView.h
//  UISwitchDemo
//
//  Created by iMac-jianjian on 16/6/27.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WJSwitchViewDelegate <NSObject>

/**
 *  开关是否开启
 *
 *  @param isopen YES 开启  NO 关闭
 *  @param tag   tag值
 */
-(void)WJSwitchViewDelegateWithSwitchStates:(BOOL)isopen withTag:(NSInteger)tag;

@end

@interface WJSwitchView : UIView

@property(nonatomic,weak) id <WJSwitchViewDelegate> delegate;//代理


-(instancetype)initWithFrame:(CGRect)frame withTag:(NSInteger)tag delegate:(id)delegate;

@end
