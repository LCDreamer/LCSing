//
//  LCDrawSignView.m
//  LCSing
//
//  Created by 刘超 on 16/8/1.
//  Copyright © 2016年 刘超. All rights reserved.
//

#import "LCDrawSignView.h"
#import "LCSign.h"

@implementation LCDrawSignView


-(void)showDrawSignView{
    
    self.transform = CGAffineTransformMakeRotation(M_PI/2);
    self.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.width);
    [self setBackgroundColor:[UIColor whiteColor]];
    self.layer.cornerRadius=15;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    _lineArray =[[NSMutableArray alloc] init];
    
   _sign = [[LCSign alloc] initWithFrame:CGRectMake(20, 45, self.frame.size.height-40, self.frame.size.width-90)];
    [_sign setBackgroundColor:[UIColor whiteColor]];
    [self sendSubviewToBack:_sign];
    [self addSubview:_sign];
    LCDrawSignView * temp = self;
    _sign.signCallBackBlock = ^(NSMutableArray * lineArray){
        temp.lineArray = lineArray;
    };
    
    
    
    UILabel * titleLabel= [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height*1/2-100, 0, 200, 40)];
    [titleLabel setText:@"请在指定区域内签名"];
    [titleLabel setFont:[UIFont italicSystemFontOfSize:20]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:titleLabel];
    
    UIButton* clearButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.frame.size.width-42.5, 100, 40)];
    [clearButton addTarget:self action:@selector(clikClear) forControlEvents:UIControlEventTouchUpInside];
    [clearButton setBackgroundImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    [self addSubview:clearButton];
    
    UIButton* closeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.height/2-40, self.frame.size.width-42.5, 100, 40)];
    [closeButton addTarget:self action:@selector(clikClose) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [self addSubview:closeButton];
    
    UIButton* okButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.height-120, self.frame.size.width-42.5, 100, 40)];
    [okButton addTarget:self action:@selector(clikOk) forControlEvents:UIControlEventTouchUpInside];
    [okButton setBackgroundImage:[UIImage imageNamed:@"confirm"] forState:UIControlStateNormal];
    [self addSubview:okButton];
    
    
    
    
}
-(void)clikClear{
    [_sign clear];
}
-(void)clikOk{
    _drawSignCallBackBlock(self.frame.size.height-40,self.frame.size.width-90,_lineArray);
}
-(void)clikClose{
    [self dismissDrawSignView];
}
-(void)dismissDrawSignView{
    id<UIApplicationDelegate> appDelegate = [[UIApplication sharedApplication] delegate];
    CGSize screenSize = [appDelegate.window.rootViewController.view bounds].size;
    [CATransaction begin];
    [UIView animateWithDuration:0.25f animations:^{
        self.frame = CGRectMake(screenSize.width, 0, screenSize.width, screenSize.height);
    } completion:^(BOOL finished) {
        //都关闭啊都关闭
        [self removeFromSuperview];
    }];
    [CATransaction commit];
}

@end
