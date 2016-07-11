//
//  PlayesRequest.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface PlayesRequest : NSObject
+(instancetype)sharePlayerRequest;
-(void)requestDoteStringleAllVedioWithID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure;
-(void)requestLOLStringleAllVedioWithID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure;
@end
