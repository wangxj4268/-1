//
//  FourViewController4.m
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "FourViewController4.h"

@interface FourViewController4 ()

@end

@implementation FourViewController4

- (void)viewDidLoad {
    [super viewDidLoad];

   self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"n4"]];
    [self configUI];

}
-(void)configUI{
 
    [self addTitle:@"意见反馈"];
    [self addBtnWithTitle:@"" withBgImageName:@"navBackBtn_hl@2x" withLocation:KLeftBar];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(KWidth/8, 200, KWidth-100, 20)];
    label.font=[UIFont systemFontOfSize:15];
    label.text=@" 加微信或来电反馈问题，我们会第一时间为你解决";
    label.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:label];
    
    NSArray *imageArr=@[@"Icon-76",@"tabbar_mainframeHL@2x"];
    NSArray *NameArr=@[@"微信公众账号",@"电话号码"];
    NSArray *NumberArr=@[@"shirimeiwen",@"0551-4471321"];
    
    for (NSInteger i=0; i<imageArr.count; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(KWidth/8, 300+100*i, 30,30)];
        imageView.image=[UIImage imageNamed:imageArr[i]];
        imageView.layer.cornerRadius=8;
        imageView.layer.masksToBounds=YES;
        [self.view addSubview:imageView];
    }
    
    for (NSInteger i=0; i<NameArr.count; i++) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(KWidth/4, 300+100*i, 100, 25)];
        label.text=NameArr[i];
        label.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:label];
    }
    
    for (NSInteger i=0; i<NumberArr.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake(KWidth/2, 300+100*i, 175, 25);
        [btn setTitle:NumberArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }
}
-(void)leftClick:(UIButton *)btn{
    [self.navigationController popToRootViewControllerAnimated:YES];
     self.hidesBottomBarWhenPushed=NO;
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
