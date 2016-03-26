//
//  OneModel.h
//  十日美文
//
//  Created by qianfeng on 16/3/19.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "JSONModel.h"

@interface OneModel : JSONModel
@property(nonatomic,copy)NSString <Optional> * image;
@property(nonatomic,copy)NSString <Optional> * pid;
@property(nonatomic,copy)NSString <Optional> * publishtime;
@property(nonatomic,copy)NSString <Optional> * summary;
@property(nonatomic,copy)NSString <Optional> * title;
@property(nonatomic,copy)NSString <Optional> * type;
@end

@interface OneModel1 : JSONModel
@property(nonatomic,strong)NSString <Optional> * imageforplay;
@property(nonatomic,strong)NSString <Optional> * title;
@property(nonatomic,strong)NSString <Optional> * author;
@property(nonatomic,strong)NSString <Optional> * times;
@property(nonatomic,strong)NSString <Optional> * text1;
@property(nonatomic,strong)NSString <Optional> * image1;

@property(nonatomic,strong)NSString <Optional> * text2;
@property(nonatomic,strong)NSString <Optional> * realtitle;
@property(nonatomic,strong)NSString <Optional> * image2;

@property(nonatomic,strong)NSString <Optional> * text3;
@property(nonatomic,strong)NSString <Optional> * text4;
@property(nonatomic,strong)NSString <Optional> * text5;
@property(nonatomic,strong)NSString <Optional> * image3;
@property(nonatomic,strong)NSString <Optional> * image4;
@property(nonatomic,strong)NSString <Optional> * authorbrief;
@end

