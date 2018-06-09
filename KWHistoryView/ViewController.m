//
//  ViewController.m
//  KWHistoryView
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "ViewController.h"
#import "KWHistoryTagView.h"
#import "KWHistoryView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1====
    NSArray *array = [NSArray arrayWithObjects:@"你陪我",@"步入蝉夏",@"越过城市喧嚣",@"歌声",@"还在游走",@"你",@"榴花般的",@"双眸", @"不见你的温柔", nil];
    
    KWHistoryTagView *JCView = [[KWHistoryTagView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 0)];
    JCView.JCSignalTagColor = [UIColor greenColor];
    [JCView setArrayTagWithLabelArray:array];
    [self.view addSubview:JCView];
    
    ///2==
    KWHistoryView *history = [[KWHistoryView alloc] initWithFrame:CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 250) andItems:@[@"你陪我",@"步入蝉夏",@"越过城市喧嚣",@"歌声",@"还在游走",@"你",@"榴花般的",@"双眸", @"不见你的温柔"] andItemClickBlock:^(NSInteger i) {
        
        NSLog(@">>>>>>>>>>%ld",i);
        
    }];
    [self.view addSubview:history];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
