//
//  ThreeViewController1.m
//  十日美文
//
//  Created by qianfeng on 16/3/20.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.

/*
 出现错误:Assertion failure in -[AFHTTPRequestSerializer requestWithMethod:URLString:parameters:error:], /Users/qianfeng/Desktop/美文项目/十日美文/AFNetworking/AFNetworking/AFURLRequestSerialization.m:283
 
-定是网址出错，网址在宏定义里不能有空格
 */

#import "ThreeViewController1.h"
#import "ThreeModel.h"
#import "Entity.h"
#import "MagicalRecord.h"
@interface ThreeViewController1 ()<UIScrollViewDelegate,UIActionSheetDelegate,UMSocialUIDelegate>
{
    NSMutableArray *_dataArray;
    float _currentSet;
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_authorbriefLabel;
    UILabel *_textLabel1;
    UILabel *_textLabel2;
    UIScrollView *scr;
}
@end

@implementation ThreeViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadData];
    _currentSet=-64;
    _dataArray=[[NSMutableArray alloc]init];
    self.view.backgroundColor=[UIColor whiteColor];
  
}
-(void)configUI{
    [self addBtnWithTitle:@"" withBgImageName:@"navBackBtn_hl@2x" withLocation:KLeftBar];
    [self addBtnWithTitle:@"编辑" withBgImageName:@"c1.png" withLocation:KRightBar];
    KWS(ws);
    UIView *bgView=[[UIView alloc]init];
    [ws.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view);
        make.left.equalTo(ws.view.mas_left).offset(2);
        make.right.equalTo(ws.view).offset(-2);
        make.bottom.equalTo(ws.view).offset(-10);
    }];
    
    scr=[[UIScrollView alloc]init];
    scr.delegate=self;
    [bgView addSubview:scr];
    [scr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bgView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    UIView *view=[[UIView alloc]init];
    [scr addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scr).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.equalTo(scr.mas_width);
    }];
    
    _imageView=[[UIImageView alloc]init];
    [view addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
        make.height.mas_equalTo(@600);
    }];
    
    _titleLabel=[[UILabel alloc]init];
    [view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
    
    _authorbriefLabel=[[UILabel alloc]init];
    [view addSubview:_authorbriefLabel];
    [_authorbriefLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
    
    _textLabel1=[[UILabel alloc]init];
    _textLabel1.numberOfLines=0;     //千万不能忘写
    [view addSubview:_textLabel1];
    [_textLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_authorbriefLabel.mas_bottom).offset(15);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
    
    _textLabel2=[[UILabel alloc]init];
    [view addSubview:_textLabel2];
    [_textLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textLabel1.mas_bottom).offset(10);
    
        make.right.equalTo(view).offset(-10);
    }];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_textLabel2.mas_bottom);
    }];
    
    //5.UISwipeGestureRecognizer:轻滑手势
    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
    //设置轻滑的方向，默认向右
    swipe.direction=UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [ws.view addGestureRecognizer:swipe];

}
-(void)handleSwipe:(UISwipeGestureRecognizer *)sender{
    if (sender.direction==UISwipeGestureRecognizerDirectionRight ) {
          NSLog(@"right swipe");
    }
    if (sender.direction==UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"left swipe");
    }
    NSLog(@"%lu",(unsigned long)sender.direction);
     NSLog(@"111");
}
-(void)loadData{
    //_data=[NSString stringWithFormat:@"%d",10462];
        NSString *urlStr=[NSString stringWithFormat:WThreeWenUrl,_data];
  
        [[HttpManager shareManager]requestWith:urlStr parameters:nil subBlock:^(id responseObject) {
      
        NSArray *arr=[NSArray arrayWithObject:responseObject];
        NSArray *array=[ThreeModel1 arrayOfModelsFromDictionaries:arr error:nil];
        [_dataArray addObjectsFromArray:array];
        
        ThreeModel1 *model=_dataArray[0];
        NSString *str=[NSString stringWithFormat:WThreeImageUrl,model.image1];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
        
        _titleLabel.text=model.title;
        _titleLabel.font=[UIFont boldSystemFontOfSize:16];
      
        _authorbriefLabel.text=model.authorbrief;
        _authorbriefLabel.font=[UIFont systemFontOfSize:14];
        _authorbriefLabel.textColor=[UIColor grayColor];
      
        _textLabel1.text=model.text1;
        _textLabel1.font=[UIFont systemFontOfSize:14];
      
        _textLabel2.text=model.text2;
        _textLabel2.font=[UIFont systemFontOfSize:14];
        
    } failureBlock:^{
        NSLog(@"🙅🙅🙅🙅🙅🙅🙅");
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y>_currentSet) {
        self.hidesBottomBarWhenPushed=YES;
        _currentSet=scrollView.contentOffset.y;
    }else{
        self.hidesBottomBarWhenPushed=NO;
        _currentSet=scrollView.contentOffset.y;
    }
        self.hidesBottomBarWhenPushed=YES;
}

-(void)leftClick:(UIButton *)btn{
        self.hidesBottomBarWhenPushed=NO;
        scr.delegate=nil;
        [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightClick:(UIButton *)btn{
        UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"编辑" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"分享" otherButtonTitles:@"收藏", nil];
        //设置样式
        actionSheet.actionSheetStyle=UIActionSheetStyleAutomatic;
        [actionSheet showInView:self.view];
}
#pragma  mark--UIActionSheetDelegate的协议方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)    buttonIndex{
        //获取单击的按钮的标题
        NSString *title=[actionSheet buttonTitleAtIndex:buttonIndex];
        //分享时执行的
        if ([title isEqualToString:@"分享"]) {
            [UMSocialSnsService presentSnsIconSheetView:self appKey:nil shareText:@"做分享吧" shareImage:[UIImage imageNamed:@"head2.jpg"] shareToSnsNames:@[UMShareToSina,UMShareToEmail,UMShareToFacebook,UMShareToTencent,UMShareToRenren,UMShareToSms] delegate:self];
    }
        //收藏时执行的
        else if([title isEqualToString:@"收藏"]){
            //判断是否已经收藏，已收藏就弹出提示框
            if([Entity MR_findByAttribute:@"pid" withValue:_data].count>0){
            [self showOnlyText:@"已收藏,请勿再点击"];
            }
            //没有收藏过的进行收藏操作
            else{
                Entity *model=[Entity MR_createEntity];
                ThreeModel1 *m1=_dataArray[0];
                model.pid=_data;
                model.title=m1.title;
                model.imageUrl=m1.image1;
                model.type=_type;
                [[NSManagedObjectContext MR_defaultContext]     MR_saveToPersistentStoreAndWait];
                [self showOnlyText:@"收藏成功"];
            }
        }
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
