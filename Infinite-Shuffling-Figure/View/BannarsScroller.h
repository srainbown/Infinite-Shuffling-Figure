//
//  BannarsScroller.h
//  Infinite-Shuffling-Figure
//
//  Created by 紫川秀 on 2017/7/6.
//  Copyright © 2017年 View. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannarsModel.h"

typedef void (^imageViewClickBlock)(BannarsModel *model);

@interface BannarsScroller : UIView

@property (nonatomic,assign)BOOL isRunloop;//是否开启定时器 default NO

@property (nonatomic,assign)NSTimeInterval dur; //default 3

@property (nonatomic,strong)UIColor *color_pageControl;

@property (nonatomic,strong)UIColor *color_currentPageControl;

@property (nonatomic,strong)imageViewClickBlock click;

@property (nonatomic,strong)BannarsModel *model;

- (instancetype)initWithFrame:(CGRect)frame withImages:(NSArray *)images withIsRunloop:(BOOL)isRunloop withBlock:(imageViewClickBlock)block;


@end
