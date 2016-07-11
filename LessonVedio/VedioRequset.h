//
//  VedioRequset.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface VedioRequset : NSObject

+(instancetype)shareVedioRequest;

-(void)requestDateStingleAllVedioWithID:(NSString *)ID Success:(SuccessResponse)success failure:(FailureResponse)failure;
-(void)requestLOLSingleAuthorAllVideoWithAuthorID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure;
@end
