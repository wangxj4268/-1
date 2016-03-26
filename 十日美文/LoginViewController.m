//
//  LoginViewController.m
//  十日美文
//
//  Created by qianfeng on 16/3/22.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "LoginViewController.h"
#define Login @"Login"
#define PassWord @"PassWord"
@interface LoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UITextField *field1;
    UIButton *btn1;
    UITextField *field2;
    UIButton *btn2;
    UIButton *btn3;
    UIAlertView *view;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"n4"]];
    [self configUI];
}

-(void)configUI{
    field1=[[UITextField alloc]initWithFrame:CGRectMake(KWidth/9, 100, KWidth*7/9, 40)];
    field1.borderStyle=UITextBorderStyleRoundedRect;
    field1.placeholder=@"请输入用户名";
    field1.font=[UIFont systemFontOfSize:15];
    field1.clearButtonMode=UITextFieldViewModeAlways;
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    label1.text=@"用户名:";
    label1.font=[UIFont systemFontOfSize:15];
    label1.textColor=[UIColor blackColor];
    field1.leftView=label1;
    field1.leftViewMode=UITextFieldViewModeAlways;
    field1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"c2"]];
    
    btn1=[UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame=CGRectMake(KWidth*8/9, 100, KWidth/9, 40);
    [btn1 setTitle:@"注册" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [self.view addSubview:field1];
    
    
    field2=[[UITextField alloc]initWithFrame:CGRectMake(KWidth/9, 160, KWidth*7/9, 40)];
    field2.borderStyle=UITextBorderStyleRoundedRect;
    field2.placeholder=@"请输入密码(不少于6位)";
    field2.font=[UIFont systemFontOfSize:15];
    field2.clearButtonMode=UITextFieldViewModeAlways;
    field2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"c2"]];
    field2.secureTextEntry=YES;
    field2.delegate=self;
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    label2.text=@"密码:";
    label2.font=[UIFont systemFontOfSize:15];
    label2.textColor=[UIColor blackColor];
    field2.leftView=label2;
    field2.leftViewMode=UITextFieldViewModeAlways;
    
    btn2=[UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame=CGRectMake(KWidth*8/9, 160, KWidth/9, 40);
    [btn2 setTitle:@"忘记密码" forState:UIControlStateNormal];
    btn2.titleLabel.numberOfLines=0;
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    btn2.titleLabel.adjustsFontSizeToFitWidth=YES;
    [self.view addSubview:btn2];
    [self.view addSubview:field2];
    
    btn3=[UIButton buttonWithType:UIButtonTypeSystem];
    btn3.frame=CGRectMake(20,260,KWidth-40, 40);
    [btn3 setTitle:@"登录" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"c2"]]];
    [btn3 addTarget:self action:@selector(btnClick3:) forControlEvents:UIControlEventTouchUpInside];
    btn3.layer.cornerRadius=8;
    btn3.layer.masksToBounds=YES;
    [self.view addSubview:btn3];
    
    
}
//注册
-(void)btnClick1:(UIButton *)sender{
    if (field2.text.length<6&&field2.text.length!=0) {
      [self showMessage:@"密码必须不少于6位数" message:@"重新输入"];
    }
   
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setObject :field1.text forKey:Login];
    [userDefaults setObject:field2.text forKey:PassWord];
    [userDefaults synchronize];
}
//忘记密码
-(void)btnClick2:(UIButton *)sender{
    if (field2.text.length<6&&field2.text.length!=0) {
        [self showMessage:@"密码必须不少于6位数" message:@"重新输入"];
    }
}
//登录
-(void)btnClick3:(UIButton *)sender{
    if (field2.text.length<6&&field2.text.length!=0) {
        [self showMessage:@"密码必须不少于6位数" message:@"重新输入"];
    }
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSString *str1=[userDefaults objectForKey:Login];
    NSString *str2=[userDefaults objectForKey:PassWord];
     NSLog(@"...%@",str1);
     NSLog(@"...%@",str2);
     NSLog(@"---%@",field1.text);
     NSLog(@"---%@",field2.text);
    if (str1.length==0||str2.length==0) {
        [self showMessage:@"信息不完整，无法登陆" message:@"确定"];
    }
    else if ([str1 isEqualToString:field1.text]&&[str2 isEqualToString:field2.text]) {
        [self showMessage:@"登录成功" message:@"确定"];
    }
}


#pragma mark--UITextFieldDelegate
//结束编辑时
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length<6&&textField.text.length!=0) {
        [self showMessage:@"密码必须不少于6位数" message:@"重新输入"];
    }
    
}
//单击键盘的return按钮时，隐藏键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
//弹出消息框
-(void)showMessage:(NSString *)str message:(NSString *)str2{

       view =[[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:str2 otherButtonTitles:nil, nil];
        view.alertViewStyle=UIAlertViewStyleDefault;
        [view show];
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
