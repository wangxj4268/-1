//
//  Entity.h
//  十日美文
//
//  Created by qianfeng on 16/3/21.
//  Copyright (c) 2016年 wangxuejian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entity : NSManagedObject

@property (nonatomic, retain) NSString * pid;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic, retain) NSString * type;
@end
