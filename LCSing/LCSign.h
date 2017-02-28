//
//  LCSign.h
//  LCSing
//
//  Created by 刘超 on 16/8/1.
//  Copyright © 2016年 刘超. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SignCallBackBlock) (NSMutableArray * lineArray);

@interface LCSign : UIView
@property(nonatomic,copy)SignCallBackBlock signCallBackBlock;
// get point  in view
-(void)addPA:(CGPoint)nPoint;
-(void)addLA;
-(void)revocation;
-(void)refrom;
-(void)clear;
-(void)setLineColor:(NSInteger)color;
-(void)setlineWidth:(NSInteger)width;


@end
