//
//  MonthSelectView.h
//  YouMiBeauty
//
//  Created by Soo on 2017/1/24.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  获取当前月份协议
 */
@protocol monthdataString <NSObject>
/**
 *  获取当前月份
 *
 *  @param datestring <#datestring description#>
 */
- (void)getmonthString:(NSString *)datestring;

@end

@interface MonthSelectView : UIView

#pragma mark 以下是月日历部分
//================================================================

/**
 *  按月计算日历方式
 */
@property (nonatomic , strong)MonthSelectView * monthSelectView;

@property (nonatomic , strong)NSMutableArray    * datesource;
@property (nonatomic , assign)NSInteger         comp;
@property (nonatomic , assign)NSInteger         offpage;//计算当天在第几页
@property (nonatomic , weak)id<monthdataString>monthdelegate;
/**
 *  日历背景颜色（按月计算）
 */
@property (nonatomic , strong)UIColor * McalenbarBGcolor;
/**
 *  被选中的月份圆点颜色
 */
@property (nonatomic , strong)UIColor * MSelecNumBGcolor;
/**
 *  当前月份圆点的背景颜色
 */
@property (nonatomic , strong)UIColor * thisMonthNumBGcolor;
/**
 *  当前月份数字颜色
 */
@property (nonatomic , strong)UIColor * thisMonthTextColor;
/**
 *  初始化日历（按月计算），如果日历小于120.0的高度将默认为120.0高度
 *
 *  @param frame 日历大小，位置
 *
 *  @return self
 */
-(id)initM_calenbarviewframe:(CGRect)frame;
- (void)getdatesource;

@end
