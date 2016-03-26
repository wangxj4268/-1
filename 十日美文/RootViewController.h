//
//  RootViewController.h
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface RootViewController : UIViewController
{
    MBProgressHUD *HUD;
}
-(void)addTitle:(NSString *)title;
-(void)addLabel:(NSString *)imageName withLocaion:(NSString *)location;
-(void)addBtnWithTitle:(NSString *)title withBgImageName:(NSString *)bgName withLocation:(NSString *)location;
-(void)leftClick:(UIButton *)btn;
-(void)rightClick:(UIButton *)btn;

-(void)loadData;
-(void)configUI;


-(void)showText:(NSString *)str;
-(void)showOnlyText:(NSString *)str;
@end
