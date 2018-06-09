//
//  KWHistoryTagView.m
//  KWHistoryView
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "KWHistoryTagView.h"

#define HORIZONTAL_PADDING 7.0f
#define VERTICAL_PADDING   3.0f
#define LABEL_MARGIN       10.0f
#define BOTTOM_MARGIN      10.0f

///随机颜色
#define RandomColor  [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];

@interface KWHistoryTagView ()
{
    CGRect _previousFrame;
    int _totalHeight;
    UIButton *_btn;
}

@end

@implementation KWHistoryTagView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _totalHeight = 0;
        self.frame = frame;
    }
    
    return self;
}

//设置 标签数组
- (void)setArrayTagWithLabelArray:(NSArray *)array {
    _previousFrame = CGRectZero;
    [array enumerateObjectsUsingBlock:^(NSString*str, NSUInteger idx, BOOL *stop) {
        
        _btn.tag = idx + 100;
        
        [self setupBtnWithNSString:str];
    }];
    
    if(_JCbackgroundColor){
        self.backgroundColor = _JCbackgroundColor;
        
    }else{
        self.backgroundColor=[UIColor whiteColor];
    }
}


//初始化按钮
- (void)setupBtnWithNSString:(NSString *)str {
    //初始化按钮
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectZero;
    if (_JCSignalTagColor) {
        _btn.backgroundColor = _JCSignalTagColor;
    }else {
        _btn.backgroundColor = RandomColor;
    }
    //设置内容水平居中
    _btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_btn setTitle:str forState:UIControlStateNormal];
    _btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    _btn.layer.cornerRadius = 5.0;
    _btn.layer.masksToBounds = YES;
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(clickHandle:) forControlEvents:UIControlEventTouchUpInside];
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]};
    CGSize StrSize = [str sizeWithAttributes:attribute];
    StrSize.width += HORIZONTAL_PADDING * 2;
    StrSize.height += VERTICAL_PADDING *2;
    ///新的 SIZE
    CGRect NewRect = CGRectZero;
    
    if (_previousFrame.origin.x + _previousFrame.size.width + StrSize.width + LABEL_MARGIN > self.bounds.size.width) {
        
        NewRect.origin = CGPointMake(10, _previousFrame.origin.y + StrSize.height + BOTTOM_MARGIN);
        _totalHeight += StrSize.height + BOTTOM_MARGIN;
    }else {
        NewRect.origin = CGPointMake(_previousFrame.origin.x + _previousFrame.size.width + LABEL_MARGIN, _previousFrame.origin.y);
    }
    NewRect.size = StrSize;
    [_btn setFrame:NewRect];
    _previousFrame = _btn.frame;
    [self setHight:self andHight:_totalHeight + StrSize.height + BOTTOM_MARGIN];
    [self addSubview:_btn];
    
}

#pragma mark -改变控件高度
- (void)setHight:(UIView *)view andHight:(CGFloat)hight
{
    CGRect tempFrame = view.frame;
    tempFrame.size.height = hight;
    view.frame = tempFrame;
}


#pragma mark -按钮的处理方法
- (void)clickHandle:(UIButton *)sender
{
    NSLog(@"点击了，点解了 ==  %ld",(long)sender.tag);
    if (self.itemClick) {
        self.itemClick (sender.tag);
    }
}


@end
