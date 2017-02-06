//
//  MonthSelectView.m
//  YouMiBeauty
//
//  Created by Soo on 2017/1/24.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "MonthSelectView.h"
#import "DateCalenCollectionViewCell.h"

@interface MonthSelectView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic , strong)UICollectionView  * monthcollectionview;

@end
static NSString *const ID = @"dateCalenCollectionViewCellIdentifier";
@implementation MonthSelectView

-(id)initM_calenbarviewframe:(CGRect)frame
{
    if (!_monthSelectView) {
        
        _monthSelectView = [[MonthSelectView alloc] init];
        
    }
    self.monthSelectView.frame = frame;
    NSArray *tempArray = @[@{@"title":@"一月"},@{@"title":@"二月"},@{@"title":@"三月"},@{@"title":@"四月"},@{@"title":@"五月"},@{@"title":@"六月"},@{@"title":@"七月"},@{@"title":@"八月"},@{@"title":@"九月"},@{@"title":@"十月"},@{@"title":@"十一月"},@{@"title":@"十二月"},];
    
    [self.datesource addObjectsFromArray:[MonthModel mj_objectArrayWithKeyValuesArray:tempArray]] ;
    
    return self;
}

- (NSMutableArray *)datesource{

    if (!_datesource) {
        _datesource = [NSMutableArray array];
    }
    return _datesource;
}

- (void)creatCollectionview
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
//    if (self.monthSelectView.frame.size.height < 120.0) {
//        CGRect  frame = self.monthSelectView.frame;
//        frame.size.height = 120.0;
//        self.monthSelectView.frame = frame;
//    }
    
//    CGFloat  S_bottom = 28.0/120.0;
//    CGFloat  S_top = 12.0/120.0;
    
//    layout.sectionInset = UIEdgeInsetsMake(self.monthSelectView.frame.size.height * S_top, 0, self.monthSelectView.frame.size.height * S_bottom, 0);
    
    self.monthcollectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, self.monthSelectView.frame.size.width,SCREEN_WIDTH/6) collectionViewLayout:layout];
    
    [self.monthcollectionview  setContentOffset:CGPointMake(self.monthSelectView.frame.size.width * self.offpage, 0)];//偏移量
    
    self.monthcollectionview.pagingEnabled = NO;
    self.monthcollectionview.delegate = self;
    self.monthcollectionview.dataSource = self;
    [self.monthcollectionview registerClass:[DateCalenCollectionViewCell class] forCellWithReuseIdentifier:ID];
    //==
    self.monthcollectionview.showsHorizontalScrollIndicator = NO;
    
    [self.monthSelectView addSubview:self.monthcollectionview];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _datesource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DateCalenCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (cell.Monthnumberlabel) {
        
        [cell.Monthnumberlabel removeFromSuperview];
    }
    MonthModel *model = [MonthModel new];
    model = _datesource[indexPath.row];
    if (model.modelSelect) {
        model.modelSelect = NO;
    }else{
    
        model.modelSelect = YES;
    }
    if (indexPath.row >= 0 && indexPath.row < 12) {
        
//        NSString * strnumber = [NSString stringWithFormat:@"%ld",indexPath.row + 1 ];

        [cell MonthLabel:indexPath comp:_comp number:model.title thisMonthNumBGcolor:_thisMonthNumBGcolor andModel:model];
        if ((indexPath.row + 1 ) == _comp){
            
            
            NSIndexPath *monthindexPath =[NSIndexPath indexPathForRow:indexPath.row inSection:0];
            [self.monthcollectionview selectItemAtIndexPath:monthindexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
            
        }
        
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.monthSelectView.frame.size.width/6, self.monthSelectView.frame.size.width/6);
    
}


- (void)getdatesource
{

    if (_comp <= 6) {
        self.offpage = 0;
    }
    if (_comp > 6 && _comp <= 12) {
        
        self.offpage = 1;
    }
    [self creatCollectionview];
    
//    [self.monthcollectionview reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DateCalenCollectionViewCell * cell = (DateCalenCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    MonthModel *model = [MonthModel new];
    model.modelSelect = !model.modelSelect;
    cell.Monthnumberlabel.backgroundColor = _MSelecNumBGcolor;
    
    NSString * gobackDate = [NSString stringWithFormat:@"%ld",(indexPath.row + 1 )];
    [self.monthdelegate getmonthString:gobackDate];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DateCalenCollectionViewCell * cell = (DateCalenCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.Monthnumberlabel.backgroundColor = [UIColor clearColor];
    NSString * strnumber = [NSString stringWithFormat:@"%ld",indexPath.row + 1];

    [cell MonthLabelindexPath:indexPath comp:_comp number:strnumber textcolor:_thisMonthTextColor];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)setMcalenbarBGcolor:(UIColor *)McalenbarBGcolor
{
    self.monthcollectionview.backgroundColor = McalenbarBGcolor ;
    _McalenbarBGcolor = McalenbarBGcolor;
}

- (void)setMSelecNumBGcolor:(UIColor *)MSelecNumBGcolor
{
    _MSelecNumBGcolor = MSelecNumBGcolor;
    
}

- (void)setThisMonthNumBGcolor:(UIColor *)thisMonthNumBGcolor
{
    _thisMonthNumBGcolor = thisMonthNumBGcolor;
    
}

- (void)setThisMonthTextColor:(UIColor *)thisMonthTextColor
{
    _thisMonthTextColor = thisMonthTextColor;
}


@end
