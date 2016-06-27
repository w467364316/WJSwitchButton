//
//  ViewController.m
//  UISwitchDemo
//
//  Created by iMac-jianjian on 16/6/27.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "ViewController.h"
#import "WJSwitchView.h"

@interface ViewController ()<WJSwitchViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *firstSwitchView;
@property (weak, nonatomic) IBOutlet UIView *secondSwitchView;
@property (weak, nonatomic) IBOutlet UIView *thirdSwitchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建view
    WJSwitchView * firstView = [[WJSwitchView alloc] initWithFrame:self.firstSwitchView.bounds withTag:1 delegate:self];
    [self.firstSwitchView addSubview:firstView];
    
    WJSwitchView * secondView = [[WJSwitchView alloc] initWithFrame:self.firstSwitchView.bounds withTag:2 delegate:self];
    [self.secondSwitchView addSubview:secondView];
    
    WJSwitchView * thirdView = [[WJSwitchView alloc] initWithFrame:self.firstSwitchView.bounds withTag:3 delegate:self];
    [self.thirdSwitchView addSubview:thirdView];
    
}
#pragma mark - WJSwitchViewDelegate
//协议方法
-(void)WJSwitchViewDelegateWithSwitchStates:(BOOL)isopen withTag:(NSInteger)tag{

    NSLog(@"%ld",tag);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
