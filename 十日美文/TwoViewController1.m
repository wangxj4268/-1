//
//  TwoViewController1.m
//  十日美文
//
//  Created by qianfeng on 16/3/20.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "TwoViewController1.h"
#import "TwoModel.h"
#import "Entity.h"
#import "MagicalRecord.h"
@interface TwoViewController1 ()<UIScrollViewDelegate,UMSocialUIDelegate,UIActionSheetDelegate>
{
    NSMutableArray *_dataArray;
    float _currentSet;
    UILabel *_titleLabel;
    UILabel *_authorLabel;
    UILabel *_timesLabel;
    UILabel *_summaryLabel;
    UILabel *_textLabel;
    
    UIScrollView *scr;
}
@end

@implementation TwoViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"n4"]];
    [self configUI];
    [self loadData];
    _currentSet=-64;
    _dataArray=[[NSMutableArray alloc]init];
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
        make.right.equalTo(ws.view.mas_right).offset(-2);
        make.bottom.equalTo(ws.view.mas_bottom).offset(-10);
    }];
    
    scr=[[UIScrollView alloc]init];
    scr.delegate=self;
    scr.bounces=NO;
    [bgView addSubview:scr];
    [scr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_top);
        make.left.equalTo(bgView.mas_left);
        make.right.equalTo(bgView.mas_right);
        make.bottom.equalTo(bgView.mas_bottom);
    }];
    
    UIView *view=[[UIView alloc]init];
    [scr addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scr).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.equalTo(scr.mas_width);
    }];
    
    _titleLabel=[[UILabel alloc]init];
    _titleLabel.numberOfLines=0;
    [view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(5);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];

    _authorLabel=[[UILabel alloc]init];
    _authorLabel.numberOfLines=0;
    [view addSubview:_authorLabel];
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
       
    }];
   
    _timesLabel=[[UILabel alloc]init];
    _timesLabel.numberOfLines=0;
    [view addSubview:_timesLabel];
    [_timesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(10);
        make.left.equalTo(_authorLabel.mas_right).offset(10);
    }];
    

    _summaryLabel=[[UILabel alloc]init];
    _summaryLabel.numberOfLines=0;
    [view addSubview:_summaryLabel];
    [_summaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timesLabel.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
    
    _textLabel=[[UILabel alloc]init];
    _textLabel.numberOfLines=0;
    [view addSubview:_textLabel];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_summaryLabel.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_textLabel.mas_bottom);
    }];
 
}

-(void)loadData{
   // _data=[NSString stringWithFormat:@"%d",10446];
    NSString *urlString=[NSString stringWithFormat:WTwoWenUrl,_data];
    [[HttpManager shareManager]requestWith:urlString parameters:nil subBlock:^(id responseObject) {
        NSArray *arr=[NSArray arrayWithObject:responseObject];
        NSArray *array=[TwoModel1 arrayOfModelsFromDictionaries:arr error:nil];
        [_dataArray addObjectsFromArray:array];
        
        TwoModel1 *model=_dataArray[0];
        _titleLabel.text=model.title;
        _titleLabel.font=[UIFont boldSystemFontOfSize:17];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        
        
        _authorLabel.text=[NSString stringWithFormat:@"作者:%@",model.author];
        _authorLabel.font=[UIFont systemFontOfSize:14];
        _authorLabel.textColor=[UIColor grayColor];
        
        _timesLabel.text=[NSString stringWithFormat:@"阅读量:%@",model.times];
        _timesLabel.font=[UIFont systemFontOfSize:14];
        _timesLabel.textColor=[UIColor grayColor];
        
        _summaryLabel.text=model.summary;
        _summaryLabel.textColor=[UIColor grayColor];
        _summaryLabel.font=[UIFont systemFontOfSize:14];
        
        _textLabel.text=model.text;
        _textLabel.font=[UIFont systemFontOfSize:14];
    } failureBlock:^{
        NSLog(@"🙅🙅🙅🙅🙅🙅");
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
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
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
            TwoModel1 *m1=_dataArray[0];
            model.pid=_data;
            model.title=m1.title;
            model.imageUrl=@"2";
            model.type=_type;
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
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
