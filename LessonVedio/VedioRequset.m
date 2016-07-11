//
//  VedioRequset.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "VedioRequset.h"


static VedioRequset *request = nil;
@implementation VedioRequset
+(instancetype)shareVedioRequest{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[VedioRequset alloc]init];
    });
    return request;

}
-(void)requestSingleAuthorAllVedioWithUrl:(NSString *)url success:(SuccessResponse)success failure:(FailureResponse)failure{
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request requestWithUrl:url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}
-(void)requestDateStingleAllVedioWithID:(NSString *)ID Success:(SuccessResponse)success failure:(FailureResponse)failure{
   [self requestSingleAuthorAllVedioWithUrl:DoteSingleAuthorAllvideosRequser_Url(ID) success:^(NSDictionary *dic) {
       success(dic);
   } failure:^(NSError *error) {
       failure(error);
   }];
    
}
-(void)requestLOLSingleAuthorAllVideoWithAuthorID:(NSString *)ID success:(SuccessResponse)success failure:(FailureResponse)failure
{
    [self requestSingleAuthorAllVedioWithUrl:LOLSignleAuthorAllVideosRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
        
    }];
    
}
@end
