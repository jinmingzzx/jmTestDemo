//
//  JMCustomCell.m
//  JMDelegateDemo
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JMCustomCell.h"
@interface JMCustomCell ()
@property (weak, nonatomic) IBOutlet UIButton *plusBt;
@property (weak, nonatomic) IBOutlet UIButton *minusBt;

@end
@implementation JMCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (IBAction)minusDidClick:(id)sender {
    //respondsToSelector 方法是判断该方法是否被响应 
    if ([self.delegate respondsToSelector:@selector(jmCustomCellMinusBtDidClickWithCustomCell:)]) {
        ///第三部 调用代理的方法
        [self.delegate jmCustomCellMinusBtDidClickWithCustomCell:self];
    }
   }


- (IBAction)plusDidClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(jmCustomCellPlusBtDidClickWithCustomCell:)]) {
        [self.delegate jmCustomCellPlusBtDidClickWithCustomCell:self];
             }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
