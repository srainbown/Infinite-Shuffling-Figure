//
//  BannarsModel.m
//  Infinite-Shuffling-Figure
//
//  Created by 紫川秀 on 2017/7/6.
//  Copyright © 2017年 View. All rights reserved.
//

#import "BannarsModel.h"

@implementation BannarsModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.pic = dict[@"pic"];
        self.link = dict[@"link"];
    }
    return self;
}


@end
