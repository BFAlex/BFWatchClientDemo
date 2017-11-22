//
//  BFFunctionItemView.m
//  BFWatchClientDemo
//
//  Created by Readboy_BFAlex on 2017/11/22.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "BFFunctionItemView.h"

@interface BFFunctionItemView () {
    NSIndexPath *_modelIndexPath;   // 模型索引
}

@end

@implementation BFFunctionItemView

+ (instancetype)functionItemWithFrame:(CGRect)frame {
    BFFunctionItemView *item = [[[NSBundle mainBundle] loadNibNamed:@"BFFunctionItemView" owner:nil options:nil] lastObject];
    if (item) {
        item.frame = frame;
    }
    [item setupGestureRecognizer];
    
    return item;
}

//- (void)configureItemViewWithIndexPath:(NSIndexPath *)indexPath {
//    [self configureItemViewWithIndexPath:indexPath andDelegate:nil];
//}
//
//- (void)configureItemViewWithIndexPath:(NSIndexPath *)indexPath andDelegate:(id<BFFunctionItemViewDelegate>)delegate {
//    
//    [self configureItemView:nil indexPath:indexPath andDelegate:delegate];
//}

- (void)configureItemView:(BFFeatureModel *)model indexPath:(NSIndexPath *)indexPath andDelegate:(id<BFFunctionItemViewDelegate>)delegate {
    
    _modelIndexPath = indexPath;
    self.delegate = delegate;
    if (model) {
#warning 根据Model数据配置item
    }
}

#pragma mark - <Private>

/**
 为Item增加手势事件: 单击 + 长按
 【手势的设置可以根据使用权限判断是否添加】
 */
- (void)setupGestureRecognizer {
    // 单击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnFunctionItemView:)];
    [self addGestureRecognizer:tap];
    // 长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressOnFunctionItemView:)];
    [self addGestureRecognizer:longPress];
}

- (void)tapOnFunctionItemView:(UIGestureRecognizer *)gesture {
    NSLog(@"%s%d", __func__, __LINE__);
    if ([self.delegate respondsToSelector:@selector(tapOnFunctionViewForIndexPath:)]) {
        [self.delegate tapOnFunctionViewForIndexPath:_modelIndexPath];
    }
}

- (void)longPressOnFunctionItemView:(UIGestureRecognizer *)gesture {
    // 只处理长按结束状态事件
    if (gesture.state != UIGestureRecognizerStateEnded) { return; }
    NSLog(@"%s%d\n%@", __func__, __LINE__, @"长按结束");
    
    if ([self.delegate respondsToSelector:@selector(longPressOnFunctionViewForIndexPath:)]) {
        [self.delegate longPressOnFunctionViewForIndexPath:_modelIndexPath];
    }
}

@end
