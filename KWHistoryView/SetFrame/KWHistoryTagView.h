//
//  KWHistoryTagView.h
//  KWHistoryView
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^itemClickBlock)(NSInteger i);

@interface KWHistoryTagView : UIView
@property (copy, nonatomic) itemClickBlock itemClick;
///设置整个View的背景颜色
@property (nonatomic, retain) UIColor *JCbackgroundColor;
//
@property (nonatomic) UIColor *JCSignalTagColor;
- (void)setArrayTagWithLabelArray:(NSArray *)array;
@end
