//
//  VedioModel.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "BaseModel.h"

@interface VedioModel : BaseModel
/** 视频作者 */
@property(nonatomic,copy)NSString* author;

/** 日期 */
@property(nonatomic,copy)NSString* date;

/** ID */
@property(nonatomic,copy)NSString* ID;

/** 平台 */
@property(nonatomic,copy)NSString* site;

/** 时间 */
@property(nonatomic,copy)NSString* time;


/** 截图 */
@property(nonatomic,copy)NSString* thumb;


/** 标题 */
@property(nonatomic,copy)NSString* title;

/** 视频网址 */
@property(nonatomic,copy)NSString* weburl;

//+(NSMutableArray *)parseVedioWithDic:(NSString *)dic;
+(NSMutableArray *)parseVedioWithDic:(NSDictionary *)dic;
@end
