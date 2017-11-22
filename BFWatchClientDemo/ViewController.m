//
//  ViewController.m
//  BFWatchClientDemo
//
//  Created by Readboy_BFAlex on 2017/11/22.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "ViewController.h"
#import "BFFunctionController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionFuncBtn:(UIButton *)sender {
    BFFunctionController *fc = [BFFunctionController functionController];
    if (fc) {
        [self.navigationController pushViewController:fc animated:true];
    }
}

@end
