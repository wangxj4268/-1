//
//  FourViewController.m
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "FourViewController.h"
#import "FourViewController4.h"
#import "FourViewController3.h"
#import "FourViewController2.h"
#import "FourViewController1.h"
#import "LoginViewController.h"
@interface FourViewController ()
{
    NSArray *_imageArray;
}
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

-(void)configUI{
    [super configUI];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0,64, 375,250)];
    imageView.image=[UIImage imageNamed:@"t3"];
    imageView.userInteractionEnabled=YES;
    [self addBtnWithTitle:@"登录" withBgImageName:@"c1.png" withLocation:KRightBar];
    _tableView.tableHeaderView=imageView;//加上一个头部视图
  //  _tableView.scrollEnabled=NO;//设置不能滚动
}

-(void)loadData{
  _imageArray=@[@"account_collect",@"account_setting",@"account_help",@"account_comment",@"account_favorite"];
    NSArray *arr=@[@"我的收藏",@"字体设置",@"关于十个",@"意见反馈",@"清除缓存"];
    for (NSInteger i=0; i<arr.count; i++) {
        [_dataArray addObject:arr[i]];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ide=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ide];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ide];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 10, 200, 30)];
    label.text=_dataArray[indexPath.row];
    [cell addSubview:label]; //没用cell.textLabel=_dataArray[indexPath.row]
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    imageView.image=[UIImage imageNamed:_imageArray[indexPath.row]];
    [cell addSubview: imageView];//没用cell.imageView.image=[UIImage imageNamed:_imageArray[indexPath.row]]
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        FourViewController1 *f1=[[FourViewController1 alloc]init];
        f1.hidesBottomBarWhenPushed=YES;
        // self.tabBarController.tabBar.hidden=YES; //注意:不用这种方法，不然会有bug
        [self.navigationController pushViewController:f1 animated:YES];
    }else if (indexPath.row==1){
        FourViewController2 *f2=[[FourViewController2 alloc]init];
        f2.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:f2 animated:YES];
    }else if(indexPath.row==2){
        FourViewController3 *f3=[[FourViewController3 alloc]init];
        f3.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:f3 animated:YES];
    }else if (indexPath.row==3){
        FourViewController4 *f4=[[FourViewController4 alloc]init];
        f4.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:f4 animated:YES];
    }else if(indexPath.row==4){
        //清理缓存
        [self clearCache];
    }
     
}
//清理缓存
-(void)clearCache{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    float size = [self folderSizeWithPath:cachePath];
    if (size <= 0) {
//        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"没有缓存需要清理!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        [alert show];
        [self showOnlyText:@"没有缓存需要清理!"];
    }else{
        NSString * str = [NSString stringWithFormat:@"您有%.2fM缓存,是否需要清理?",size];
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}
//单击提示框的按钮时
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.title isEqualToString:@"提示"]) {
        if (buttonIndex == 1) {
            NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            NSArray * files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
            for (NSString * p in files) {
                NSError * error;
                NSString * path = [cachePath stringByAppendingPathComponent:p];
                if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
                    [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
                }
            }
            [self clearCacheSuccess];
        }
    }
}

-(void)clearCacheSuccess{
//    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"清理成功!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//    [alert show];
    [self showOnlyText:@"清理完毕"];
}

//计算文件夹的大小
-(float)folderSizeWithPath:(NSString *)folderPath{
    NSFileManager * manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) {
        return 0;
    }
    NSEnumerator * childFilesEnumerator = [[manager subpathsAtPath:folderPath]objectEnumerator];
    NSString * fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject])!=nil) {
        NSString * fileAbsoulutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsoulutePath];
    }
    return folderSize/(1024.0*1024.0);
}
//计算文件的大小
- (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

-(void)rightClick:(UIButton *)btn{
    LoginViewController *log=[[LoginViewController alloc]init];
    log.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:log animated:YES];
                          
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
