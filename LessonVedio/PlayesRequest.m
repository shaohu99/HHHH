//
//  PlayesRequest.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "PlayesRequest.h"

static PlayesRequest *request = nil;
@implementation PlayesRequest
+(instancetype)sharePlayerRequest{
  
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[PlayesRequest alloc]init];
    });
    return request;
}
//请求单个视频 (返回视频url
-(void)requestSingleAuthorAllPlayesRequestWithUrl:(NSString *)url success:(SuccessResponse)success failure:(FailureResponse)failure{
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request requestWithUrl:url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}
//请求dote视频
-(void)requestDoteStringleAllVedioWithID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure
{
    [self requestSingleAuthorAllPlayesRequestWithUrl:DotaSingleVideoRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
//请求LOL视频
-(void)requestLOLStringleAllVedioWithID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure
{
  [self requestSingleAuthorAllPlayesRequestWithUrl:LOLSignleAuthorAllVideosRequest_Url(ID) success:^(NSDictionary *dic) {
      success(dic);
  } failure:^(NSError *error) {
      failure(error);
  }];
    
}
@end
