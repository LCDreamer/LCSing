//
//  ViewController.m
//  LCSing
//
//  Created by 刘超 on 16/8/1.
//  Copyright © 2016年 刘超. All rights reserved.
//

#import "ViewController.h"
#import "LCDrawSignView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x-50, self.view.frame.size.height*1/2-20, 100, 40)];
    [_button setTitle:@"签名" forState:UIControlStateNormal];
    [_button setBackgroundColor:[UIColor redColor]];
    [_button addTarget:self action:@selector(showSing) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
    [self.view setBackgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)showSing{
    LCDrawSignView *singnView=[[LCDrawSignView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:singnView];
    [singnView showDrawSignView];
    
    singnView.drawSignCallBackBlock = ^(float width,float height,NSArray * lineArray){
        NSLog(@"width === %f",width);
        NSLog(@"height === %f",height);
        for (int i=0; i < [lineArray count]; i++) {
            NSLog(@"%@",lineArray[i]);
        }
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
