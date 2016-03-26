//
//  Header.h
//  十日美文
//
//  Created by qianfeng on 16/3/18.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#ifndef _____Header_h
#define _____Header_h


#define KHeight [UIScreen mainScreen].bounds.size.height
#define KWidth [UIScreen mainScreen].bounds.size.width


#define KLeftBar @"KLeftBar"
#define KRightBar @"KRightBar"

#define  KWS(ws) __weak typeof (&*self) ws=self //弱引用

#pragma mark--网址相关
//总的 ：
#define WOneUrl @"http://api.shigeten.net/api/Critic/GetCriticList"

//获取id拼接具体的文章：id=10450
#define WOneWenUrl @"http://api.shigeten.net/api/Critic/GetCriticContent?id=%@"

//阅读数  根据id和type拼接
//http://api.shigeten.net/api/Times/GetTimes?id=10450&type=1

///照片
#define WOneImageUrl  @"http://images.shigeten.net/%@"



//第二页：
#define WTwoUrl @"http://api.shigeten.net/api/Novel/GetNovelList"
//阅读数  根据id和type拼接
// http://api.shigeten.net/api/Times/GetTimes?id=10443&type=2
//具体文章
#define WTwoWenUrl @"http://api.shigeten.net/api/Novel/GetNovelContent?id=%@"


//第三页
#define WThreeUrl @"http://api.shigeten.net/api/Diagram/GetDiagramList"

//阅读数
//http://api.shigeten.net/api/Times/GetTimes?id=10461&type=3

//具体内容
#define WThreeWenUrl @"http://api.shigeten.net/api/Diagram/GetDiagramContent?id=%@"

//照片
#define WThreeImageUrl @"http://images.shigeten.net/%@"

#endif
