//
//  MyHeadView.h
//  QQ列表
//
//  Created by lxx on 16/2/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyHeadView;
@protocol headViewDelegate<NSObject>
-(void)didClickHeadView:(MyHeadView *)myHeadview;
@end
@interface MyHeadView : UITableViewHeaderFooterView

@property(weak,nonatomic)UIButton *button;
/**
 *  分组状态
 */
@property(assign,nonatomic)BOOL isOpen;
/**
 *  标题分组
 */
@property(assign,nonatomic)NSInteger section;

@property(weak,nonatomic)id<headViewDelegate>delegate;
@end
