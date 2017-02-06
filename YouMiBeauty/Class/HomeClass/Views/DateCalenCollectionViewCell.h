//
//  DateCalenCollectionViewCell.h
//  YouMiBeauty
//
//  Created by Soo on 2017/1/24.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthModel : NSObject

@property(nonatomic,copy)   NSString *title;
@property(nonatomic,assign) BOOL modelSelect;
@end

@interface DateCalenCollectionViewCell : UICollectionViewCell

@property (nonatomic , strong)UILabel * numberlabel;
@property (nonatomic , strong)UILabel * Monthnumberlabel;
@property (nonatomic , strong)UIButton * monthNumBtn;

-(void)TodayLabel:(NSIndexPath *)indexPath  comp:(NSDateComponents *)comp  todaycomp:(NSDateComponents *)todaycomp  week_firsday_month:(NSInteger)week_firsday_month number:(NSString *)num todayNumBGcolor:(UIColor *)color;
-(void)TodayLabelindexPath:(NSIndexPath *)indexPath  comp:(NSDateComponents *)comp  todaycomp:(NSDateComponents *)todaycomp  week_firsday_month:(NSInteger)week_firsday_month number:(NSString *)num textcolor:(UIColor *)color;

//以下是月模式
- (void)MonthLabel:(NSIndexPath *)indexPath comp:(NSInteger )comp number:(NSString *)num thisMonthNumBGcolor:(UIColor *)color andModel:(MonthModel *)model;

- (void)MonthLabelindexPath:(NSIndexPath *)indexPath comp:(NSInteger )comp number:(NSString *)num textcolor:(UIColor *)color;

@end

