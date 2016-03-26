//
//  FourViewController3.m
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "FourViewController3.h"

@interface FourViewController3 ()

@end

@implementation FourViewController3

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"n4"]];
    [self configUI];
}
-(void)configUI{
    [self addBtnWithTitle:@"" withBgImageName:@"navBackBtn_hl@2x" withLocation:KLeftBar];
    [self addTitle:@"关于十个"];
//    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(160, 140, 60, 60)];
//    imageView.image=[UIImage imageNamed:@"home_like@3x"];
//    [self.view addSubview:imageView];
    
    NSArray *arr=@[@"每晚十点更新",@"一篇影评一篇文章",@"每晚入睡前用十分钟读到最美内容",@"影评独特而温馨 文章兼顾见识与审美",@"也许很长也许很短 但必定值得耐心阅读"];
    for (NSInteger i=0; i<arr.count; i++) {
        UILabel *label=[[UILabel alloc]init];
        if (i<arr.count-2) {
           label.frame=CGRectMake(20, 240+i*25, KWidth-30, 20) ;
        }else{
            label.frame=CGRectMake(20, 250+i*25, KWidth-30, 20);
        }
        label.font=[UIFont systemFontOfSize:13];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=arr[i];
        [self.view addSubview:label];
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
