//
//  VedioModel.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "VedioModel.h"

@implementation VedioModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}

+(NSMutableArray *)parseVedioWithDic:(NSDictionary *)dic{
    NSArray *authors = [dic objectForKey:@"videos"];
    NSMutableArray *returnAuthors = [NSMutableArray array];
    for (NSDictionary *tempdic in authors) {
        VedioModel *mode = [[VedioModel alloc]init];
        [mode setValuesForKeysWithDictionary:tempdic];
        [returnAuthors addObject:mode];
        
        
    }
    NSLog(@"%@",returnAuthors);
    return returnAuthors;
}

@end
