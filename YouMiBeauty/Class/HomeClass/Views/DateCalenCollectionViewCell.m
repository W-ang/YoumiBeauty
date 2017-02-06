//
//  DateCalenCollectionViewCell.m
//  YouMiBeauty
//
//  Created by Soo on 2017/1/24.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "DateCalenCollectionViewCell.h"

@implementation MonthModel

@end

@implementation DateCalenCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}

-(void)TodayLabel:(NSIndexPath *)indexPath  comp:(NSDateComponents *)comp  todaycomp:(NSDateComponents *)todaycomp  week_firsday_month:(NSInteger)week_firsday_month number:(NSString *)num todayNumBGcolor:(UIColor *)color{
    
    self.numberlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    self.numberlabel.clipsToBounds = YES;
    self.numberlabel.layer.cornerRadius = 22.5;
    [self.contentView addSubview:self.numberlabel];
    self.numberlabel.textAlignment = 1;
    
    self.numberlabel.text = num;
    
    if (comp.year == todaycomp.year && todaycomp.month == comp.month && comp.day == todaycomp.day &&indexPath.row ==( week_firsday_month - 1 + comp.day + 7 ) ){
        
        self.numberlabel.backgroundColor = color;
    }
    
}


-(void)TodayLabelindexPath:(NSIndexPath *)indexPath comp:(NSDateComponents *)comp todaycomp:(NSDateComponents *)todaycomp week_firsday_month:(NSInteger)week_firsday_month number:(NSString *)num textcolor:(UIColor *)color
{
    
    if (comp.year == todaycomp.year && todaycomp.month == comp.month && comp.day == todaycomp.day &&indexPath.row ==( week_firsday_month - 1 + comp.day + 7 ) ){
        
        self.numberlabel.textColor = color;
    }
    
}

//月模式

- (void)MonthLabel:(NSIndexPath *)indexPath comp:(NSInteger )comp number:(NSString *)num thisMonthNumBGcolor:(UIColor *)color andModel:(MonthModel *)model
{
    self.Monthnumberlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.Monthnumberlabel.center = self.contentView.center;
    self.Monthnumberlabel.font = UIBaseFont(14);
    self.Monthnumberlabel.adjustsFontSizeToFitWidth = YES;
    self.Monthnumberlabel.layer.masksToBounds = YES;
    self.Monthnumberlabel.layer.cornerRadius = 20.8;
    [self.contentView addSubview:self.Monthnumberlabel];
    self.Monthnumberlabel.textAlignment = 1;
    
    self.Monthnumberlabel.text = num;
    if ((indexPath.row + 1) == comp) {
        
//        self.Monthnumberlabel.backgroundColor = color;
    }

    if (model.modelSelect) {
        
        self.Monthnumberlabel.backgroundColor = [UIColor redColor];
    }
    
}

- (void)MonthLabelindexPath:(NSIndexPath *)indexPath comp:(NSInteger )comp number:(NSString *)num textcolor:(UIColor *)color
{
    if ((indexPath.row + 1) == comp) {
        
        self.Monthnumberlabel.textColor = color;
        
    }
    
}
@end

