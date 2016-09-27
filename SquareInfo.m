//
//  SquareInfo.m
//  paipaifan
//
//  Created by YangJie on 16/9/18.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "SquareInfo.h"

@implementation SquareInfo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)squareInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
