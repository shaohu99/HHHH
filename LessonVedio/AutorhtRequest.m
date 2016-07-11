
//
//  AutorhtRequest.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "AutorhtRequest.h"


static AutorhtRequest *request = nil;
@implementation AutorhtRequest


//+(instancetype)shareAuthorRequest{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        request = [[self alloc]init];
//    });
//    return request;
//}
+ (instancetype)shareAuthorRequest{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[self alloc] init];
    });
    return request;
}

//- (id)allocWithZone:(struct _NSZone *)zone{
//    return request;
//    
//}
//+(id)allocWithZone:(struct _NSZone *)zone{
//    return request;
//}
//
//+(id)copyWithZone:(struct _NSZone *)zone{
//    return request;
//}
//请求dote所有主播
-(void)requestDoteAllAuthorsSuccess:(SuccessResponse)success failure:(FailureResponse)failure{
    [self requestAllAuthorsWithUrl:DotaAllAuthorsRequestUrl success:^(NSDictionary *dic) {
            success(dic);
    } failure:^(NSError *error) {
       failure(error);
    }];
}
//
-(void)requestAllLoLSuccess:(SuccessResponse)success failure:(FailureResponse)failure{
    [self requestAllAuthorsWithUrl:LOLAllAuthorsRequestUrl success:^(NSDictionary *dic) {
            success(dic);
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

-(void)requestAllAuthorsWithUrl:(NSString *)url success:(SuccessResponse)success failure:(FailureResponse)failure{
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request requestWithUrl:url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}


@end
