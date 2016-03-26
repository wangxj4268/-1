//
//  OneModel.m
//  十日美文
//
//  Created by qianfeng on 16/3/19.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "OneModel.h"

@implementation OneModel
+(JSONKeyMapper *)keyMapper{
    //将id对应的value赋给pid
    return  [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"pid"}];
}
@end

@implementation OneModel1


@end
