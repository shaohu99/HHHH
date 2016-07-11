//
//  AutorhtRequest.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface AutorhtRequest : NSObject
+(instancetype)shareAuthorRequest;
-(void)requestAllAuthorsWithUrl:(NSString *)url success:(SuccessResponse)success failure:(FailureResponse)failure;
-(void)requestAllLoLSuccess:(SuccessResponse)success failure:(FailureResponse)failure;
-(void)requestDoteAllAuthorsSuccess:(SuccessResponse)success failure:(FailureResponse)failure;
@end
