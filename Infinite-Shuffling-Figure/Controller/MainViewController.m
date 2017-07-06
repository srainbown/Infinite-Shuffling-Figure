//
//  MainViewController.m
//  Infinite-Shuffling-Figure
//
//  Created by 紫川秀 on 2017/7/6.
//  Copyright © 2017年 View. All rights reserved.
//

#import "MainViewController.h"
#import "BannarsScroller.h"
#import "BannarsModel.h"
#import "BannarsDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define WS(weakSelf)        __weak __typeof(&*self)weakSelf = self;

@interface MainViewController ()

@property (nonatomic, strong) BannarsScroller *bannarsScroller;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createData];
    [self createUI];
    
}

#pragma mark -- 懒加载
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark -- 数据
-(void)createData{

}

#pragma mark -- UI
-(void)createUI{
    
    WS(weakSelf);
    if (_dataArray.count > 1) {
        
        _bannarsScroller = [[BannarsScroller alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 200) withImages:_dataArray withIsRunloop:YES withBlock:^(BannarsModel *model) {
            BannarsDetailViewController *vc = [[BannarsDetailViewController alloc]init];
            [weakSelf presentViewController:vc animated:YES completion:^{
                vc.model = model;
            }];
        }];
        [self.view addSubview:_bannarsScroller];
        
    }else if(_dataArray.count == 1){
        
        UIImageView *bannarsImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 200)];
        [self.view addSubview:bannarsImage];
        BannarsModel *model = _dataArray[0];
        [bannarsImage sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
        bannarsImage.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageOnclick)];
        [bannarsImage addGestureRecognizer:tap];
    }
}

//单张广告的点击事件
-(void)imageOnclick{
    
    if (_dataArray.count == 1) {
        BannarsModel *model = _dataArray[0];
        BannarsDetailViewController *vc = [[BannarsDetailViewController alloc]init];
        [self presentViewController:vc animated:YES completion:^{
            vc.model = model;
        }];
    }
}

@end
