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
@property (nonatomic, strong) NSArray *flSectionTitleArr;

@end

@implementation BFFunctionController

#pragma mark - <Property>

- (NSArray *)flDataSourseArr {
    if (!_flDataSourseArr) {
        NSArray *firstSectionArr = [self setupFirstSectionArr];
        NSArray *secondSectionArr = [self setupSecondSectionArr];
        NSArray *thirdSectionArr = [self setupThirdSectionArr];
        NSArray *forthSectionArr = [self setupForthSectionArr];
        NSArray *fifthSectionArr = [self setupFifthSectionArr];
        _flDataSourseArr =@[firstSectionArr,
                            secondSectionArr,
                            thirdSectionArr,
                            forthSectionArr,
                            fifthSectionArr];
    }
    
    return _flDataSourseArr;
}

- (NSArray *)flSectionTitleArr {
    if (!_flSectionTitleArr) {
        _flSectionTitleArr = @[@"功能1", @"功能2", @"功能3", @"功能4"];
    }
    
    return _flSectionTitleArr;
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
    
    // temple
    for (int i = 0; i < 2; i++) {
        [arr addObject:[NSString stringWithFormat:@"xxx"]];
    }
    
    return arr;
}
- (NSArray *)setupSecondSectionArr {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    // temple
    for (int i = 0; i < 3; i++) {
        [arr addObject:[NSString stringWithFormat:@"xxx"]];
    }
    
    return arr;
}
- (NSArray *)setupThirdSectionArr {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    // temple
    for (int i = 0; i < 1; i++) {
        [arr addObject:[NSString stringWithFormat:@"xxx"]];
    }
    
    return arr;
}
- (NSArray *)setupForthSectionArr {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    // temple
    for (int i = 0; i < 5; i++) {
        [arr addObject:[NSString stringWithFormat:@"xxx"]];
    }
    
    return arr;
}

- (NSArray *)setupFifthSectionArr {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    // temple
    for (int i = 0; i < 7; i++) {
        [arr addObject:[NSString stringWithFormat:@"xxx"]];
    }
    
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
    
    if (self.flSectionTitleArr.count > section) {
        return self.flSectionTitleArr[section];
    } else {
        return @"其他功能";
    }
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
    
    BFFunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseID];
    if (!cell) {
        cell = [BFFunctionCell cell];
    }
    NSArray *sectionArr = self.flDataSourseArr[indexPath.section];
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
