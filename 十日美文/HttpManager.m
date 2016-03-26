//
//  HttpManager.m
//  Test
//
//  Created by qianfeng on 16/3/11.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager
+(HttpManager *)shareManager{
    static HttpManager *manager=nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        if (!manager) {
            manager=[[HttpManager alloc ]init];
        }
    });
    return manager;
}
-(void)requestWith:(NSString *)urlString parameters:(NSDictionary *)dic subBlock:(SucBlock)subBlock failureBlock:(FailureBlock)failureBlock{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager GET:urlString parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (subBlock) {
            subBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error%@",error.localizedDescription);
        if (failureBlock) {
            failureBlock();
        }
    }];
}
@end
