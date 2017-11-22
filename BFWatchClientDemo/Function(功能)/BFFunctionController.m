//
//  BFFunctionController.m
//  BFWatchClientDemo
//
//  Created by Readboy_BFAlex on 2017/11/22.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "BFFunctionController.h"
#import "BFFunctionCell.h"

#define kCellReuseID @"BFFunctionCellReuseID"

@interface BFFunctionController () <UITableViewDelegate, UITableViewDataSource, BFFunctionItemViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *featureListTV;

@property (nonatomic, strong) NSArray *flDataSourseArr;

@end

@implementation BFFunctionController

#pragma mark - <Property>

- (NSArray *)flDataSourseArr {
    if (!_flDataSourseArr) {
        NSArray *firstFuncArr = @[@"11", @"12"];
        NSArray *secondFuncArr = @[@"21", @"22", @"23"];
        NSArray *thirdFuncArr = @[@"31"];
        NSArray *forthFuncArr = @[@"41", @"42", @"43", @"44", @"45"];
        _flDataSourseArr =@[firstFuncArr, secondFuncArr, thirdFuncArr, forthFuncArr];
    }
    
    return _flDataSourseArr;
}

#pragma mark - <Life Cycle>

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupFeatureListTV];
}

#pragma mark - <Public>

+ (instancetype)functionController {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"BFFunctionSB" bundle:nil];
    BFFunctionController *fc = [sb instantiateViewControllerWithIdentifier:@"BFFunctionControllerID"];
    
    return fc;
}

#pragma mark <Private>

/**
 设置功能列表
 */
- (void)setupFeatureListTV {
    self.featureListTV.delegate = self;
    self.featureListTV.dataSource = self;
    
    self.featureListTV.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
}

/**
 设置每一个Section的成员数组
 */
- (NSArray *)setupFirstSectionArr {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    return arr;
}
- (NSArray *)setupSecondSectionArr {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    return arr;
}

/**
 构造每一个功能item的Model
 */
#warning 构造功能item

#pragma mark - <Delegate && DataSource>
#pragma mark <Feature List Table View>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 3;
    return self.flDataSourseArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"功能分类";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 根据行数计算高度
    NSUInteger itemMaxNumEachRow = 4;
    // cell中的子item -> width:height = 4:5
    NSArray *dsArr = self.flDataSourseArr[indexPath.section];
    if (dsArr.count <= 0) { return 0; }
    // 计算每个section中item行数
    int itemCount = dsArr.count;
    int itemRowNum = itemCount / itemMaxNumEachRow ;    // 按照每行最多四个item计算
    if ((itemCount % itemMaxNumEachRow) > 0) { itemRowNum++; }
    // 计算每个item的height
    float itemWidth = [UIScreen mainScreen].bounds.size.width / itemMaxNumEachRow;
    float itemHeight = itemWidth * 1.25;
    
    return itemRowNum * itemHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    BFFunctionCell *cell = [BFFunctionCell shareFunctionCell];
    
    NSArray *sectionArr = self.flDataSourseArr[indexPath.section];
    BFFunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseID];
    if (!cell) {
        cell = [BFFunctionCell cell];
    }
    [cell configureCellWithItemArr:sectionArr indexPath:indexPath itemDelegate:self];
    
    return cell;
}

#pragma mark <BFFunctionItemViewDelegate>

- (void)tapOnFunctionViewForIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击item索引号:[%d][%d]", indexPath.section, indexPath.row);
    
    NSString *msg = [NSString stringWithFormat:@"点击按钮索引号:[%d][%d]", indexPath.section, indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作结果" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)longPressOnFunctionViewForIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"长按item索引号:[%d][%d]", indexPath.section, indexPath.row);
    
    NSString *msg = [NSString stringWithFormat:@"长按按钮索引号:[%d][%d]", indexPath.section, indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"操作结果" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
