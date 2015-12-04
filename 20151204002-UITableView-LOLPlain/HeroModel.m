//
//  HeroModel.m
//  20151204002-UITableView-LOLPlain
//
//  Created by Rainer on 15/12/4.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel

/**
 *  初始化一个英雄实体类（对象方法）
 */
- (instancetype)initHeroWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/**
 *  初始化一个英雄实体类（对象方法）
 */
+ (instancetype)heroWithDictionary:(NSDictionary *)dictionary {
    return [[HeroModel alloc] initHeroWithDictionary:dictionary];
}

/**
 *  返回所有英雄列表
 */
+ (NSArray *)heroArray {
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"]];
    
    NSMutableArray *heroArray = [NSMutableArray array];
    
    [plistArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        HeroModel *heroModel = [self heroWithDictionary:obj];
        
        [heroArray addObject:heroModel];
    }];
    
    return heroArray;
}

@end
