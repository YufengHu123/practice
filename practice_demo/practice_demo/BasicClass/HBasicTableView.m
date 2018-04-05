//
//  HBasicTableView.m
//  practice_demo
//
//  Created by 胡玉峰 on 2017/10/18.
//  Copyright © 2017年 胡玉峰. All rights reserved.
//

#import "HBasicTableView.h"
@interface   HBasicTableView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy)numberOfRow       numberOfRowBlock;
@property (nonatomic,copy)cellForRow        cellForRowBlock;
@property (nonatomic,copy)cellHeightForRow  cellHeightForRowBlock;
@property (nonatomic,copy)viewForHeader     viewForHeaderBlock;
@property (nonatomic,copy)viewForFooder     viewForFooderBlock;
@end

@implementation HBasicTableView

+(UITableView *)getTableViewWithFrame:(CGRect)frame
                             andStyle:(UITableViewStyle)style
                           andDataNum:(numberOfRow)numberOfRowBlock
                        andCellForRow:(cellForRow)cellForRowBlock
                  andCellHeightForRow:(cellHeightForRow)cellHeightForRowBlock
                     andViewForHeader:(viewForHeader)viewForHeaderBlock
                     andViewForFooder:(viewForFooder)viewForFooderBlock
{
    
    HBasicTableView * tableView = [[HBasicTableView alloc]initWithFrame:frame style:style];
    tableView.numberOfRowBlock = numberOfRowBlock;
    tableView.cellForRowBlock = cellForRowBlock;
    tableView.viewForHeaderBlock = viewForHeaderBlock;
    tableView.viewForFooderBlock = viewForFooderBlock;
    tableView.delegate = tableView;
    
    return tableView;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self =  [super initWithFrame:frame style:style]) {
        self.backgroundView =  [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tableview_bg"]];
    }
    return self;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (self.cellForRowBlock) {
        return self.cellForRowBlock(indexPath);
    }
    return [UITableViewCell new];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.numberOfRowBlock) {
        self.numberOfRowBlock();
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellHeightForRowBlock) {
        self.cellHeightForRowBlock(indexPath);
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.viewForHeaderBlock) {
        self.viewForHeaderBlock(section);
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.viewForFooderBlock) {
        self.viewForFooderBlock(section);
    }
    return nil;
}


@end
