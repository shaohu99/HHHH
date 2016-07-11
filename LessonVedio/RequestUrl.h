//
//  RequestUrl.h
//  LessonVedio
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#ifndef RequestUrl_h
#define RequestUrl_h


//dote 全部主波的请求url
#define DotaAllAuthorsRequestUrl @"http://api.dotaly.com/api/v1/authors?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0"
//lol
#define LOLAllAuthorsRequestUrl @"http://api.dotaly.com/lol/api/v1/authors?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E"
//单个主播所有视频
#define DoteSingleAuthorAllvideosRequser_Url(ID)  [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/shipin/latest?author=%@&iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&limit=50", ID]


//lol 单个主播所有视频 url
#define LOLSignleAuthorAllVideosRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/shipin/latest?author=%@&iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&limit=50", ID]
//dote 视频地址
//dota 单个视频请求 url
#define DotaSingleVideoRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/getvideourl?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&type=mp4&vid=%@", ID]
//LOL视频地址
#define LOLAllVedioRequestVedio_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/getvideourl?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&type=flv&vid=%@",ID]

#endif /* RequestUrl_h */
