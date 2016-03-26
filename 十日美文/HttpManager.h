//
//  HttpManager.h
//  Test
//
//  Created by qianfeng on 16/3/11.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^SucBlock)(id responseObject);
typedef void (^FailureBlock) ();

@interface HttpManager : NSObject

+(HttpManager *)shareManager;

-(void)requestWith:(NSString *)urlString parameters:(NSDictionary *)dic subBlock:(SucBlock)subBlock failureBlock:(FailureBlock)failureBlock;
@end
