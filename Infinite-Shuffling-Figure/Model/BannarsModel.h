//
//  BannarsModel.h
//  Infinite-Shuffling-Figure
//
//  Created by 紫川秀 on 2017/7/6.
//  Copyright © 2017年 View. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannarsModel : NSObject

@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSString *pic;//图片
@property (nonatomic, copy) NSString *link;//链接

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
