//
//  KWHistoryFlowLayout.m
//  KWHistoryView
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "KWHistoryFlowLayout.h"

@implementation KWHistoryFlowLayout
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for(int i = 0; i < [attributes count]; i++) {
        if (i == 0) {
            UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = 10;
            currentLayoutAttributes.frame = frame;
            continue;
        }
        //当前attributes
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        //上一个attributes
        UICollectionViewLayoutAttributes *prevLayoutAttributes    = attributes[i - 1];
        //我们想设置的最大间距，可根据需要改
        NSInteger maximumSpacing                                  = 5;
        
        //前一个cell的最右边
        NSInteger origin                                          = CGRectGetMaxX(prevLayoutAttributes.frame);
        //如果当前一个cell的最右边加上我们想要的间距加上当前cell的宽度依然在contentSize中，我们改变当前cell的原点位置
        //不加这个判断的后果是，UICollectionView只显示一行，原因是下面所有cell的x值都被加到第一行最后一个元素的后面了
        if(origin + maximumSpacing + currentLayoutAttributes.frame.size.width < self.collectionViewContentSize.width) {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = origin + maximumSpacing;
            currentLayoutAttributes.frame = frame;
        }else {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = 5;
            currentLayoutAttributes.frame = frame;
        }
    }
    return attributes;
}

@end
