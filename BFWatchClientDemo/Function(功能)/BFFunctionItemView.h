//
//  BFFunctionItemView.h
//  BFWatchClientDemo
//
//  Created by Readboy_BFAlex on 2017/11/22.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFFeatureModel.h"

@protocol BFFunctionItemViewDelegate <NSObject>

@optional
- (void)tapOnFunctionViewForIndexPath:(NSIndexPath *)indexPath;
- (void)longPressOnFunctionViewForIndexPath:(NSIndexPath *)indexPath;

@end

@interface BFFunctionItemView : UIView

@property (nonatomic, weak) id<BFFunctionItemViewDelegate> delegate;

+ (instancetype)functionItemWithFrame:(CGRect)frame;

- (void)configureItemView:(BFFeatureModel *)model indexPath:(NSIndexPath *)indexPath andDelegate:(id<BFFunctionItemViewDelegate>)delegate;

@end


