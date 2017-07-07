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
#define FILEPATH @"/Users/dangbei/Desktop/Test/Infinite-Shuffling-Figure/Infinite-Shuffling-Figure/Other/json.json"

@interface MainViewController ()

@property (nonatomic, strong) BannarsScroller *bannarsScroller;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"233~~";
    
    [self createData];
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
    
    NSData *data = [[NSData alloc]initWithContentsOfFile:FILEPATH];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *array = dict[@"items"];
    
    for (NSDictionary *dic in array) {
        BannarsModel *model = [[BannarsModel alloc]initWithDict:dic];
        [self.dataArray addObject:model];
    }
    [self createUI];
    
}

#pragma mark -- UI
-(void)createUI{
    
    WS(weakSelf);
    if (_dataArray.count > 1) {
        
        _bannarsScroller = [[BannarsScroller alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 200) withImages:_dataArray withIsRunloop:YES withBlock:^(BannarsModel *model) {
            BannarsDetailViewController *vc = [[BannarsDetailViewController alloc]init];
            vc.model = model;
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }];
        [self.view addSubview:_bannarsScroller];
        _bannarsScroller.frame = CGRectMake(0, 64, SCREEN_WIDTH, 200);
        
    }else if(_dataArray.count == 1){
        
        UIImageView *bannarsImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 200)];
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
        vc.model = model;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
