//
//  MyTableViewCell.h
//  homeworkBuyTable
//
//  Created by Tim on 2016/5/11.
//  Copyright © 2016年 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellName;
@property (weak, nonatomic) IBOutlet UILabel *cellNumber;
@property (weak, nonatomic) IBOutlet UILabel *cellPrice;

@end
