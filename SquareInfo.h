//
//  SquareInfo.h
//  paipaifan
//
//  Created by YangJie on 16/9/18.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SquareInfo : NSObject

@property (nonatomic,copy) NSString *userText;
@property (nonatomic,copy) NSString *userIcon;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *userPicture;

@property (nonatomic,assign) BOOL vip;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)squareInfoWithDict:(NSDictionary *)dict;
@end
