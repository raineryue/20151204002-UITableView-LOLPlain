//
//  HeroModel.h
//  20151204002-UITableView-LOLPlain
//
//  Created by Rainer on 15/12/4.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroModel : NSObject

/** 头像 */
@property (nonatomic, strong) NSString *icon;

/** 名称 */
@property (nonatomic, strong) NSString *name;

/** 描述 */
@property (nonatomic, strong) NSString *intro;

/**
 *  初始化一个英雄实体类（对象方法）
 */
- (instancetype)initHeroWithDictionary:(NSDictionary *)dictionary;

/**
 *  初始化一个英雄实体类（对象方法）
 */
+ (instancetype)heroWithDictionary:(NSDictionary *)dictionary;

/**
 *  返回所有英雄列表
 */
+ (NSArray *)heroArray;

@end
