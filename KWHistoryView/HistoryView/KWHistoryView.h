//
//  KWHistoryView.h
//  KWHistoryView
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^itemClickBlock)(NSInteger i);

@interface KWHistoryView : UIView
@property (copy, nonatomic) itemClickBlock itemClick;


- (id)initWithFrame:(CGRect)frame
           andItems:(NSArray *)items
  andItemClickBlock:(itemClickBlock)click;
@end
