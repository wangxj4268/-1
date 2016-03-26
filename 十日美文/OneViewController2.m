//
//  OneViewController2.m
//  十日美文
//
//  Created by qianfeng on 16/3/19.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.

 /*
 出现link错误，就是系统代码没有写全 model.m文件中
 
 调试约束时，可以用#if 0和#endif来分个检验有没有错误
 
有label时使用自动布局，应该分情况使用 行数=0，不然会出错
 */


#import "OneViewController2.h"
#import "MagicalRecord.h"
#import "Entity.h"
#import "OneModel.h"

@interface OneViewController2 ()<UIScrollViewDelegate,UMSocialUIDelegate>
{
    NSMutableArray *_dataArray;
    float _currentSet;
    
    UIImageView *_imageforplay;
    UILabel *_title;
    UILabel *_author;
    UILabel *_times;
    UILabel *_text1;
    UIImageView *_imageView1;
    UILabel *_text2;
    UILabel *_realtitle;
    UIImageView *_imageView2;
    UILabel *_text3;
    UILabel *_text4;
    UILabel *_text5;
    UIImageView *_imageView3;
    UIImageView *_imageView4;
    UILabel *_author1;//后面的一个作者名
    UILabel *_authorbrief;
    UIScrollView *scr;
}

@end

@implementation OneViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadData];
    _currentSet=-64;
    _dataArray=[[NSMutableArray alloc]init];
    

    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"n4"]];
}

-(void)configUI{
    [self addBtnWithTitle:@"" withBgImageName:@"navBackBtn_hl@2x" withLocation:KLeftBar];
    [self addBtnWithTitle:@"编辑" withBgImageName:@"c1.png" withLocation:KRightBar];
    
    KWS(ws);
    UIView *bgView=[[UIView alloc]init];
    [ws.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).offset(0);
        make.left.equalTo(ws.view).offset(2);
        make.right.equalTo(ws.view).offset(-2);
        make.bottom.equalTo(ws.view).offset(-10);
    }];
    
    scr=[[UIScrollView alloc]init];
    scr.delegate=self;
    scr.bounces=NO;
    [bgView addSubview:scr];
    [scr mas_makeConstraints:^(MASConstraintMaker *make) {
          make.edges.equalTo(bgView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    UIView *view=[[UIView alloc]init];
    [scr addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scr).insets(UIEdgeInsetsMake(0, 0, 0, 0));//内嵌到scrollView的内容视图上去，Masonary对此进行了优化
        make.width.equalTo(scr);
    }];
    
    _imageforplay=[[UIImageView alloc]init];
    _imageforplay.userInteractionEnabled=YES;
    [view addSubview:_imageforplay];
    [_imageforplay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(0);
        make.left.equalTo(view.mas_left);
        make.right.equalTo(view.mas_right);
        make.height.mas_equalTo(@200);
    }];

    _title=[[UILabel alloc]init];
    _title.numberOfLines=0;
    [view addSubview:_title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageforplay.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];

    _author=[[UILabel alloc]init];
    _author.numberOfLines=0;
    [view addSubview:_author];
    [_author mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_title.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
    }];
    
    _times=[[UILabel alloc]init];
    _times.numberOfLines=0;
    [view addSubview:_times];
    [_times mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_author.mas_right).offset(2);
        make.top.equalTo(_title.mas_bottom).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
    
  
    _text1=[[UILabel alloc]init];
    _text1.numberOfLines=0;
    [view addSubview:_text1];
    [_text1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_times.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
        
    _imageView1=[[UIImageView alloc]init];
    [view addSubview:_imageView1];
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_text1.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
        make.height.mas_equalTo(@200);
    }];

    _text2=[[UILabel alloc]init];
    _text2.numberOfLines=0;
    [view addSubview:_text2];
    [_text2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView1.mas_bottom).offset(5);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
        
    _realtitle=[[UILabel alloc]init];
    _realtitle.numberOfLines=0;
    [view addSubview:_realtitle];
    [_realtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_text2.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];

    _imageView2=[[UIImageView alloc]init];
    [view addSubview:_imageView2];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_realtitle.mas_bottom).offset(5);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
        make.height.mas_equalTo(@200);
    }];
        
    _text3=[[UILabel alloc]init];//
    _text3.numberOfLines=0;
    [view addSubview:_text3];
    [_text3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView2.mas_bottom).offset(5);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
        
    _text4=[[UILabel alloc]init];
    _text4.numberOfLines=0;
    [view addSubview:_text4];
    [_text4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_text3.mas_bottom).offset(5);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
        
    _text5=[[UILabel alloc]init];//
    _text5.numberOfLines=0;
    [view addSubview:_text5];
    [_text5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_text4.mas_bottom).offset(5);
        make.left.equalTo(view).offset(10);
        make.right.equalTo(view).offset(-10);
    }];
        
    _imageView3=[[UIImageView alloc]init];
    [view addSubview:_imageView3];
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_text5.mas_bottom).offset(5);
        make.left.right.equalTo(_text5);//
        make.height.mas_equalTo(@200);
    }];
        
    _imageView4=[[UIImageView alloc]init];
    [view addSubview:_imageView4];
    [_imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView3.mas_bottom).offset(2);
        make.left.right.equalTo(_imageView3);
        make.height.mas_equalTo(@200);
    }];
    
    _author1=[[UILabel alloc]init];
    _author1.numberOfLines=0;
    [view addSubview:_author1];
    [_author1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView4.mas_bottom).offset(10);
        make.left.equalTo(view).offset(10);
    }];

    
    _authorbrief=[[UILabel alloc]init];
    _authorbrief.numberOfLines=0;
    [view addSubview:_authorbrief];
    [_authorbrief mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_author1.mas_bottom).offset(5);
        make.left.equalTo(view).offset(10);
    }];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_authorbrief.mas_bottom);
    }];
    
}


-(void)loadData{
    //_data=[NSString stringWithFormat:@"%d",10453];
    NSString *urlString=[NSString stringWithFormat:WOneWenUrl,_data];
    [[HttpManager shareManager]requestWith:urlString parameters:nil subBlock:^(id responseObject) {
        NSArray *arr=[NSArray arrayWithObject:responseObject];
        NSArray *array=[OneModel1 arrayOfModelsFromDictionaries:arr error:nil];
        [_dataArray addObjectsFromArray:array];

        OneModel1 *model=_dataArray[0];

        NSString *str=[NSString stringWithFormat:WOneImageUrl,model.imageforplay];
        [_imageforplay sd_setImageWithURL:[NSURL URLWithString:str]];
        
        _title.text=model.title;
        _title.font=[UIFont boldSystemFontOfSize:17];
        _author.text=[NSString stringWithFormat:@"作者:%@", model.author];
        _author.font=[UIFont systemFontOfSize:12];
        _times.text=[NSString stringWithFormat:@"阅读量:%@",model.times];
        _times.font=[UIFont systemFontOfSize:12];
        
        _text1.text=model.text1;
        _text1.textColor=[UIColor grayColor];
        _text1.alpha=0.8;
        _text1.font=[UIFont systemFontOfSize:14];
        
        NSString *str1=[NSString stringWithFormat:WOneImageUrl,model.image1];
        [_imageView1 sd_setImageWithURL:[NSURL URLWithString:str1]];
        
        _text2.text=model.text2;
        _text2.font=[UIFont systemFontOfSize:14];
        
        _realtitle.text=model.realtitle;
        _realtitle.textColor=[UIColor grayColor];
        _realtitle.font=[UIFont systemFontOfSize:14];
        
        NSString *str2=[NSString stringWithFormat:WOneImageUrl,model.image2];
        [_imageView2 sd_setImageWithURL:[NSURL URLWithString:str2]];
        
        _text3.text=model.text3;
        _text3.font=[UIFont systemFontOfSize:14];
        
        _text4.text=model.text4;
        _text4.font=[UIFont systemFontOfSize:14];
        
        _text5.text=model.text5;
        _text5.font=[UIFont systemFontOfSize:14];
        
        NSString *str3=[NSString stringWithFormat:WOneImageUrl,model.image3];
        [_imageView3 sd_setImageWithURL:[NSURL URLWithString:str3]];
        
        NSString *str4=[NSString stringWithFormat:WOneImageUrl,model.image4];
        [_imageView4 sd_setImageWithURL:[NSURL URLWithString:str4]];
        
        _author1.text=model.author;
        _author1.font=[UIFont boldSystemFontOfSize:17];
        
        _authorbrief.text=model.authorbrief;
        _authorbrief.font=[UIFont systemFontOfSize:14];
        _authorbrief.textColor=[UIColor grayColor];
     
    } failureBlock:^{
        NSLog(@"🙅🙅🙅🙅🙅🙅🙅");
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y>_currentSet) {
        _currentSet=scrollView.contentOffset.y;
        self.hidesBottomBarWhenPushed=YES;
    }
    else {
        _currentSet=scrollView.contentOffset.y;
        self.hidesBottomBarWhenPushed=NO;
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
            [self showOnlyText:@"已收藏，请勿再点击"];
        }
        //没有收藏过的进行收藏操作
        else{
            Entity *model=[Entity MR_createEntity];
            OneModel1 *m1=_dataArray[0];
            model.pid=_data;
            model.title=m1.title;
            model.imageUrl=m1.imageforplay;
            model.type=_type;
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            [self showOnlyText:@"收藏成功"];
        }
    }
}


#pragma mark--分享的代理

//点击选中分享的平台之后调用的方法,可以根据分享的平台设置分享的内容
-(void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData{
    if (platformName == UMShareToSina) {
        socialData.shareText = @"分享到新浪微博的文字内容";
    }
    else if(platformName ==UMShareToEmail){
        socialData.shareText = @"分享到邮箱的文字内容";
    }
    else if(platformName ==UMShareToFacebook){
        socialData.shareText = @"分享到脸书的文字内容";
    }
    else if(platformName ==UMShareToTencent){
        socialData.shareText = @"分享到腾讯微博的文字内容";
    }
    else if(platformName ==UMShareToRenren){
        socialData.shareText = @"分享到人人网的文字内容";
    }
    else if(platformName ==UMShareToSms){
        socialData.shareText = @"分享到短信的文字内容";
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
