//
//  FourViewController2.m
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "FourViewController2.h"

@interface FourViewController2 ()
{
    UILabel *_label;
    UILabel *_label2;
    NSInteger fontSize;  //字号
    NSInteger state;     //按钮的状态 0，1，2
}
@end

@implementation FourViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"n4"]];
    [self configUI];
}

-(void)configUI{
    [self addTitle:@"字体设置"];
    [self addBtnWithTitle:@"" withBgImageName:@"navBackBtn_hl@2x" withLocation:KLeftBar];
    
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSString *b1=[userDefaults objectForKey:@"size"];
    NSString *b2=[userDefaults objectForKey:@"state"];
    state=[b2 intValue];
    fontSize=[b1 intValue];
    if (!fontSize) {  //最开始时，让字号默认是14
        fontSize=14;
    }
    NSLog(@"%ld",(long)fontSize);
    KWS(ws);
    UIView *view=[[UIView alloc]init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(ws.view).offset(200);
       make.left.equalTo(ws.view).offset(10);
       make.right.equalTo(ws.view).offset(-10);
    }];
    
    _label=[[UILabel alloc]init];
    _label.font=[UIFont systemFontOfSize: fontSize];
    _label.numberOfLines=0;
    _label.text=@"我已经老了，在人来人往的大厅，有一位老人他向我走来，他说我认识你，那时的你还年轻，美丽，你的身边有许许多多的追求者，不过跟那时相比，我更喜欢现在你经历了沧桑的容颜";
    [view addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(view);
    }];
    
    _label2=[[UILabel alloc]init];
    _label2.font=[UIFont systemFontOfSize:fontSize];
    _label2.text=@"-《情人》";
    [view addSubview:_label2];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label.mas_bottom).offset(10);
        make.right.equalTo(_label);
    }];
    [ view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_label2);//压迫scrollView，lastView代表最后一个视图
    }];
    
    NSArray *nameArr=@[@"眼神儿好",@"不大不小",@"我要大大"];
    for (int i=0; i<nameArr.count;i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
         [btn setBackgroundImage:[UIImage imageNamed:@"home_like@3x"] forState:UIControlStateNormal];
        UILabel *label=[[UILabel alloc]init];
        NSLog(@"✨");
        if (i==0) {
            btn.frame=CGRectMake(80, 410, 20, 20);
            label.frame=CGRectMake(70, 430, 40, 40);
            if (state==0||!state) { //当按钮状态不存在或者为0时，都是这个颜色
                [btn setBackgroundImage:[UIImage imageNamed:@"que_laud_hl@2x"] forState:UIControlStateNormal];
            }
        }else if(i==1){
            btn.frame=CGRectMake(160, 405, 25, 25);
            label.frame=CGRectMake(150, 430, 40, 40);
            if (state==1) {
                [btn setBackgroundImage:[UIImage imageNamed:@"que_laud_hl@2x"] forState:UIControlStateNormal];
            }
        }else if (i==2){
            btn.frame=CGRectMake(245, 400, 30, 30);
            label.frame=CGRectMake(240, 430, 40, 40);
            if (state==2) {
                [btn setBackgroundImage:[UIImage imageNamed:@"que_laud_hl@2x"] forState:UIControlStateNormal];
            }
        }
        
       
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=100+i;
        label.text=nameArr[i];
        label.textAlignment=NSTextAlignmentCenter;
        label.font=[UIFont systemFontOfSize:10];
        [self.view addSubview:label];
        [self.view addSubview:btn];
        
    }
    
}
-(void)btnClick:(UIButton *)btn{
    UIButton *bt1= (UIButton*)[self.view viewWithTag:100];
    UIButton *bt2= (UIButton*)[self.view viewWithTag:101];
    UIButton *bt3= (UIButton*)[self.view viewWithTag:102];
    
        if (btn.tag==100) {
            [bt1 setBackgroundImage:[UIImage imageNamed:@"que_laud_hl@2x"] forState:UIControlStateNormal];
            [bt2 setBackgroundImage:[UIImage imageNamed:@"home_like@3x"] forState:UIControlStateNormal];
            [bt3 setBackgroundImage:[UIImage imageNamed:@"home_like@3x"] forState:UIControlStateNormal];
            _label.font=[UIFont systemFontOfSize:14];
            _label2.font=[UIFont systemFontOfSize:14];
            
            NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
            [userDefaults setObject :@"14" forKey:@"size"];//将字号保存
            [userDefaults setObject:@"0" forKey:@"state"];//将状态保存
            [userDefaults synchronize];
          
        }
         if (btn.tag==101) {
            [bt2 setBackgroundImage:[UIImage imageNamed:@"que_laud_hl@2x"] forState:UIControlStateNormal];
             [bt1 setBackgroundImage:[UIImage imageNamed:@"home_like@3x"] forState:UIControlStateNormal];
             [bt3 setBackgroundImage:[UIImage imageNamed:@"home_like@3x"] forState:UIControlStateNormal];
              _label.font=[UIFont systemFontOfSize:17];
              _label2.font=[UIFont systemFontOfSize:17];
             NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
             [userDefaults setObject :@"17" forKey:@"size"];
             [userDefaults setObject:@"1" forKey:@"state"];
             [userDefaults synchronize];
        }
         if (btn.tag==102) {
             [bt3 setBackgroundImage:[UIImage imageNamed:@"que_laud_hl@2x"] forState:UIControlStateNormal];
             [bt1 setBackgroundImage:[UIImage imageNamed:@"home_like@3x"] forState:UIControlStateNormal];
             [bt2 setBackgroundImage:[UIImage imageNamed:@"home_like@3x"] forState:UIControlStateNormal];
               _label.font=[UIFont systemFontOfSize:20];
              _label2.font=[UIFont systemFontOfSize:20];
          
             NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
             [userDefaults setObject :@"20" forKey:@"size"];
             [userDefaults setObject:@"2" forKey:@"state"];
             [userDefaults synchronize];
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
