//
//  SquareTableViewCell.h
//  paipaifan
//
//  Created by YangJie on 16/9/18.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SquareCellFrame;

@interface SquareTableViewCell : UITableViewCell

@property (nonatomic,strong) SquareCellFrame *squareCellFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
