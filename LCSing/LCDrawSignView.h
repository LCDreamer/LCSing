//
//  LCDrawSignView.h
//  LCSing
//
//  Created by 刘超 on 16/8/1.
//  Copyright © 2016年 刘超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCSign.h"
typedef void(^DrawSignCallBackBlock) (float width,float height,NSArray * lineArray);
@interface LCDrawSignView : UIView
@property(nonatomic,strong)LCSign * sign;
@property(nonatomic,strong)DrawSignCallBackBlock  drawSignCallBackBlock;
@property(nonatomic,strong)NSMutableArray * lineArray;
-(void)showDrawSignView;
-(void)dismissDrawSignView;


@end
