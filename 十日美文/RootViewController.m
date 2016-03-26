//
//  RootViewController.m
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

-(void)configUI{
    NSLog(@"子类需要重写configUI");
}
-(void)loadData{
    NSLog(@"子类需要重写这个方法");
}
-(void)addTitle:(NSString*)title{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
    label.text=title;
    self.navigationItem.titleView=label;
}

-(void)addBtnWithTitle:(NSString *)title withBgImageName:(NSString *)bgName withLocation:(NSString *)location{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:14];
    btn.titleLabel.adjustsFontSizeToFitWidth=YES;
    btn.frame=CGRectMake(0, 0, 20, 20);
    btn.layer.cornerRadius=8;
    btn.layer.masksToBounds=YES;
    
    [btn setBackgroundImage:[UIImage imageNamed:bgName] forState:UIControlStateNormal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    if ([location isEqualToString:KLeftBar]) {
        [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem=item;
    }else if ([location isEqualToString:KRightBar]){
        btn.frame=CGRectMake(0, 0, 60, 30);
        [btn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem=item;
    }
}

-(void)addLabel:(NSString *)imageName withLocaion:(NSString *)location{
 
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:label.frame];
    imageView.image=[UIImage imageNamed:imageName];
    [label addSubview:imageView];
     UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:label];
    if ([location isEqualToString:KLeftBar]) {
        self.navigationItem.leftBarButtonItem=item;
    }else if ([location isEqualToString:KRightBar]){
        self.navigationItem.rightBarButtonItem=item;
    }

}

-(void)showText:(NSString *)str{
    //初始化进度框，置于当前的View当中
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    //如果设置此属性则当前的view置于后台
    HUD.dimBackground = YES;
    
    //设置对话框文字
    HUD.labelText = str;
    
    //显示对话框
    [HUD showAnimated:YES whileExecutingBlock:^{
        //对话框显示时需要执行的操作
        sleep(1);
    } completionBlock:^{
        //操作执行完后取消对话框
        [HUD removeFromSuperview];
        HUD = nil;
    }];

}

-(void)showOnlyText:(NSString *)str{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = str;
    HUD.mode = MBProgressHUDModeText;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [HUD removeFromSuperview];
        
        HUD = nil;
    }];

}
-(void)leftClick:(UIButton *)btn{
    NSLog(@"子类需要重写这个方法");
}
-(void)rightClick:(UIButton *)btn{
    NSLog(@"子类需要重写这个方法");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
