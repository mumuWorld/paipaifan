//
//  SquareTableViewCell.m
//  paipaifan
//
//  Created by YangJie on 16/9/18.
//  Copyright © 2016年 YangJie. All rights reserved.
//

#import "SquareTableViewCell.h"
#import "SquareCellFrame.h"
#import "SquareInfo.h"
#import "Common.h"

@interface SquareTableViewCell ()

/**
 *  头像
 */
@property (nonatomic, weak) UIImageView *iconView;
/**
 *  vip
 */
@property (nonatomic, weak) UIImageView *vipView;
/**
 *  配图
 */
@property (nonatomic, weak) UIImageView *pictureView;
/**
 *  昵称
 */
@property (nonatomic, weak) UILabel *nameLabel;
/**
 *  正文
 */
@property (nonatomic, weak) UILabel *introLabel;
@end

@implementation SquareTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // Initialization code
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
//    MyNSLog(@"%s",__func__);
    static NSString *identifier = @"square";
    
    SquareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[SquareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
/**
 *  构造方法(在初始化对象的时候会调用)
 *  一般在这个方法中添加需要显示的子控件
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 2.创建昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = NameFont;
        // nameLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 3.创建vip
        UIImageView *vipView = [[UIImageView alloc] init];
        vipView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        
        // 4.创建正文
        UILabel *introLabel = [[UILabel alloc] init];
        introLabel.font = TextFont;
        introLabel.numberOfLines = 0;
        // introLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:introLabel];
        self.introLabel = introLabel;
        
        // 5.创建配图
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
        
    }
    return self;
    
}
/**
 *  set方法
 *
 *  @param weiboFrame
 */
- (void)setSquareCellFrame:(SquareCellFrame *)squareCellFrame
 {
     _squareCellFrame = squareCellFrame;
     
     // 1.给子控件赋值数据
     [self settingData];
     // 2.设置frame
     [self settingFrame];
 }
- (void)settingData
{
     SquareInfo *squareInfo = self.squareCellFrame.squareInfo;
    
    // 设置头像
    self.iconView.image = [UIImage imageNamed:squareInfo.userIcon];
    // 设置昵称
    self.nameLabel.text = squareInfo.userName;
    // 设置vip
    if (squareInfo.vip) {
        self.vipView.hidden = NO;
        self.nameLabel.textColor = [UIColor redColor];
    } else {
        self.vipView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    // 设置内容
    self.introLabel.text = squareInfo.userText;
    
    // 设置配图
    if (squareInfo.userPicture) {// 有配图
        self.pictureView.image = [UIImage imageNamed:squareInfo.userPicture];
        self.pictureView.hidden = NO;
    } else {
        self.pictureView.hidden = YES;
    }
}
- (void)settingFrame
{
    // 设置头像的frame
    self.iconView.frame = self.squareCellFrame.iconF;
    
    // 设置昵称的frame
    self.nameLabel.frame = self.squareCellFrame.nameF;
    
    // 设置vip的frame
    self.vipView.frame = self.squareCellFrame.vipF;
    
    // 设置正文的frame
    self.introLabel.frame = self.squareCellFrame.textF;
    
    // 设置配图的frame
    
    if (self.squareCellFrame.squareInfo.userPicture) {// 有配图
        self.pictureView.frame = self.squareCellFrame.pictrueF;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
