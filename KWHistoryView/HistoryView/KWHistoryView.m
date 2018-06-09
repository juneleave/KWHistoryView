//
//  KWHistoryView.m
//  KWHistoryView
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "KWHistoryView.h"
#import "KWHistoryFlowLayout.h"

@interface KWHistoryView () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArr;
}
@end

@implementation KWHistoryView

-(id)initWithFrame:(CGRect)frame andItems:(NSArray *)items andItemClickBlock:(itemClickBlock)click{
    
    if (self == [super initWithFrame:frame]) {
        _dataArr = [NSMutableArray arrayWithArray:items];
        _itemClick = click;
        self.userInteractionEnabled = YES;
        [self configBaseView];
    }
    return self;
}

- (void)configBaseView{
    self.backgroundColor = [UIColor whiteColor];
    KWHistoryFlowLayout *flow = [[KWHistoryFlowLayout alloc] init];
    flow.minimumLineSpacing = 5;
    flow.minimumInteritemSpacing = 5;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark -UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArr.count + 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _dataArr.count) {
        return CGSizeMake(self.frame.size.width, 40);
    }
    NSString *str = _dataArr[indexPath.row];
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGSize size = [str boundingRectWithSize:CGSizeMake(self.frame.size.width, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size;
    size.height = 30;
    size.width += 10;
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(3, 5, 3, 3);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.row == _dataArr.count) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
        /* 判断最后一个item的内容 如果没有历史记录 内容就为暂无历史记录  否则为清除历史记录 */
        label.text = (_dataArr.count==0?(@"暂无历史记录"):(@"清除历史记录"));
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor cyanColor];
        [cell.contentView addSubview:label];
        return cell;
    }
    NSString *str = _dataArr[indexPath.row];
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize size = [str boundingRectWithSize:CGSizeMake(self.frame.size.width, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, 40)];
    label.text = str;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    cell.contentView.layer.cornerRadius = 5;
    cell.contentView.clipsToBounds = YES;
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:label];
    label.center = cell.contentView.center;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.itemClick) {
        self.itemClick(indexPath.row);
    }
}

@end
