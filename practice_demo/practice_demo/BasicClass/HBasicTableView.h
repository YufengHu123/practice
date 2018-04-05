//
//  HBasicTableView.h
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/18.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  NSInteger          (^numberOfRow)(void);
typedef  UITableViewCell *  (^cellForRow)(NSIndexPath *indexPath);
typedef  CGFloat            (^cellHeightForRow)(NSIndexPath * indexPath);
typedef  UIView *           (^viewForHeader)(NSInteger section);
typedef  UIView *            (^viewForFooder)(NSInteger section);

@interface HBasicTableView : UITableView
+(UITableView *)getTableViewWithFrame:(CGRect)frame
                             andStyle:(UITableViewStyle )style
                           andDataNum:(numberOfRow)numberOfRowBlock
                        andCellForRow:(cellForRow)cellForRowBlock
                  andCellHeightForRow:(cellHeightForRow)cellHeightForRowBlock
                     andViewForHeader:(viewForHeader)viewForHeaderBlock
                     andViewForFooder:(viewForFooder)viewForFooderBlock;
@end
