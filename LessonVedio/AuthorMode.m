//
//  AuthorMode.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "AuthorMode.h"

@implementation AuthorMode

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _authorID = value;
    }
}
+(NSMutableArray *)parseAuthorsWithDic:(NSDictionary *)dic{
    NSArray *authors = [dic objectForKey:@"authors"];
    NSMutableArray *returnAuthors = [NSMutableArray array];
    for (NSDictionary *tempdic in authors) {
        AuthorMode *mode = [[AuthorMode alloc]init];
        [mode setValuesForKeysWithDictionary:tempdic];
        [returnAuthors addObject:mode];
        
    }
    return returnAuthors;
}
@end
