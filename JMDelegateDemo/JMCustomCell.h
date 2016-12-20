//
//  JMCustomCell.h
//  JMDelegateDemo
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
//声明cell类 以便协议中参数使用
@class JMCustomCell;
///第一步 写一个协议
@protocol  JMCustomCellDelegate<NSObject>
@optional
//@required 默认必须遵守 @optional可遵守
//协议方法
- (void)jmCustomCellPlusBtDidClickWithCustomCell:(JMCustomCell *)customCell;

- (void)jmCustomCellMinusBtDidClickWithCustomCell:(JMCustomCell *)customCell;
@end

@interface JMCustomCell : UITableViewCell
///第二步 代理属性 weak修饰  id类型(解除耦合性)
@property (nonatomic,weak) id<JMCustomCellDelegate> delegate;
@end
