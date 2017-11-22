//
//  BFFunctionCell.m
//  BFWatchClientDemo
//
//  Created by Readboy_BFAlex on 2017/11/22.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "BFFunctionCell.h"

#define kItemNumEachRow 4

@implementation BFFunctionCell

#pragma mark - <Life Cycle>

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"%s, %d", __func__, __LINE__);
}

- (NSString *)description {
    NSString *desc = @"这是一个测试功能cell";
    
    return desc;
}

#pragma mark - <Public>

//+ (instancetype)shareFunctionCell {
//    BFFunctionCell *cell = [self cell];
//    
//    if (cell) {
//        NSLog(@"自定义cell创建成功");
//    }
//    
//    return cell;
//}
//
//+ (instancetype)functionCellWithItemArr:(NSArray *)itemArr {
//    NSLog(@"%s, %d", __func__, __LINE__);
//    
//    BFFunctionCell *cell = [self cell];
//    
////    if (cell && itemArr.count > 0) {
////        // 计算分布行数【传进来的功能都是可显示的】
////        int itemRows = itemArr.count / kItemNumEachRow;
////        if ((itemArr.count % kItemNumEachRow) > 0) {
////            itemRows++;
////        }
////        NSLog(@"cell [width:%f, height:%f]", cell.bounds.size.width, cell.bounds.size.height);
////        // item的width && height
//////        float itemWidth = cell.bounds.size.width / kItemNumEachRow;
////        float itemWidth = [UIScreen mainScreen].bounds.size.width / kItemNumEachRow;
////        float itemHeight = itemWidth * 1.25;
////        
////        // 根据模型数组创建功能View
////        for (int i = 0; i < itemArr.count; i++) {
////            // 计算功能View的Frame
////            int xIndex = i % kItemNumEachRow;
////            int yIndex = i / kItemNumEachRow;
////            CGRect itemFrame = CGRectMake(xIndex * itemWidth, yIndex * itemHeight, itemWidth, itemHeight);
////            // 初始化item组件
////            BFFunctionItemView *item = [BFFunctionItemView functionItemWithFrame:itemFrame];
////            [cell addSubview:item];
////        }
////    }
//    if (cell) {
//        [cell configureCellWithItemArr:itemArr indexPath:nil];
//    }
//    
//    return cell;
//}

+ (instancetype)cell {
    BFFunctionCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BFFunctionCell" owner:nil options:nil] lastObject];
    
    return cell;
}

//- (void)configureCellWithItemArr:(NSArray *)itemArr indexPath:(NSIndexPath *)indexPath {
//    
//    [self configureCellWithItemArr:itemArr indexPath:indexPath itemDelegate:nil];
//}

- (void)configureCellWithItemArr:(NSArray *)itemArr indexPath:(NSIndexPath *)indexPath itemDelegate:(id<BFFunctionItemViewDelegate>)delegate {
    
    if (itemArr.count > 0) {
        // 计算分布行数【传进来的功能都是可显示的】
        int itemRows = itemArr.count / kItemNumEachRow;
        if ((itemArr.count % kItemNumEachRow) > 0) { itemRows++; }
        NSLog(@"cell [width:%f, height:%f]", self.bounds.size.width, self.bounds.size.height);
        // item的width && height
        float itemWidth = [UIScreen mainScreen].bounds.size.width / kItemNumEachRow;
        float itemHeight = itemWidth * 1.25;
        
        // 根据模型数组创建功能View
        for (int i = 0; i < itemArr.count; i++) {
            // 计算功能View的Frame
            int xIndex = i % kItemNumEachRow;
            int yIndex = i / kItemNumEachRow;
            CGRect itemFrame = CGRectMake(xIndex * itemWidth, yIndex * itemHeight, itemWidth, itemHeight);
            // 初始化item组件
            BFFunctionItemView *item = [BFFunctionItemView functionItemWithFrame:itemFrame];
            BFFeatureModel *itemModel = itemArr[indexPath.row];
            NSIndexPath *iPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
//            [item configureItemViewWithIndexPath:iPath];
            [item configureItemView:itemModel indexPath:iPath andDelegate:delegate];
                        
            [self addSubview:item];
        }
    }
}


#pragma mark - <Action>


@end
