//
//  BFFunctionCell.h
//  BFWatchClientDemo
//
//  Created by Readboy_BFAlex on 2017/11/22.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFFunctionItemView.h"

@interface BFFunctionCell : UITableViewCell

//+ (instancetype)shareFunctionCell;
//+ (instancetype)functionCellWithItemArr:(NSArray *)itemArr;

+ (instancetype)cell;

//- (void)configureCellWithItemArr:(NSArray *)itemArr indexPath:(NSIndexPath *)indexPath;
- (void)configureCellWithItemArr:(NSArray *)itemArr indexPath:(NSIndexPath *)indexPath itemDelegate:(id<BFFunctionItemViewDelegate>) delegate;

@end
