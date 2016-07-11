//
//  VediosViewController.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "VediosViewController.h"
#import "VedioCollectionViewCell.h"
#import "VedioRequset.h"
#import "VedioModel.h"
#import "PlayerView.h"
#import "PlayesRequest.h"
#import "PlayerModel.h"
@interface VediosViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
VedioCollectionViewCellDelegate
>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property(nonatomic,assign)NSInteger  layoutType;//显示布局的形式
@property(nonatomic,strong)NSMutableArray *vedioArray;
@property(strong,nonatomic)NSMutableArray *lolsArray;
//播放视频所需的view
@property(strong,nonatomic)PlayerView *playerview;
@property(nonatomic,strong)NSIndexPath *currentPath; //当前path
@property(strong ,nonatomic)VedioCollectionViewCell *currentCell;//获得当前cell
@property(assign, nonatomic)BOOL isPlaying;
@property(strong, nonatomic)NSArray *visibleIndexPaths;
@end

@implementation VediosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.autoContentAccessingProxy = YES;
    self.layoutType = 0;// 0 是一行显示两个
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(WindownWidth/2.0,232 );
   
    self.collectionview.collectionViewLayout = layout;
    
    [self.collectionview registerNib:[UINib nibWithNibName:@"VedioCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:VedioCollectionViewCell_ID];
    self.vedioArray = [NSMutableArray array];
    self.lolsArray = [NSMutableArray array];
    [self addRightitem];
    if (self.sourcefrom == 0 ) {
         [self requestDotaVedos];
    } else if (self.sourcefrom == 1){
        [self requstlolVediosWith];
    }
}
-(void)addRightitem{
    
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(chanageLayouttye:)];
    self.navigationItem.rightBarButtonItem = rightitem;
}
-(void)chanageLayouttye:(UIBarButtonItem *)sender
{
    if (self.layoutType == 0) {
        self.layoutType = 1;
    }else if (self.layoutType == 1){
        self.layoutType = 0;
    }else {
        
    }
    [self.collectionview reloadData];
}
//解析数据
-(void)requestDotaVedos{
    __weak typeof(self)weakself = self;
    [[VedioRequset shareVedioRequest]requestDateStingleAllVedioWithID:self.autID Success:^(NSDictionary *dic) {
        weakself.vedioArray = [VedioModel parseVedioWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.collectionview reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
        
}
-(void)requstlolVediosWith{
    __weak typeof(self)weakself = self;
    [[VedioRequset shareVedioRequest]requestLOLSingleAuthorAllVideoWithAuthorID:self.autID success:^(NSDictionary *dic) {
        weakself.vedioArray = [VedioModel parseVedioWithDic:dic];
      dispatch_async(dispatch_get_main_queue(), ^{
          [weakself.collectionview reloadData];
      });
    } failure:^(NSError *error) {
        
    }];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.layoutType == 0) {
        return CGSizeMake(WindownWidth/2.0, 232);
    }else if (self.layoutType == 1){
        return CGSizeMake(WindownWidth, 232);
    }
    return CGSizeMake(WindownWidth/2.0, 232);
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.vedioArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VedioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:VedioCollectionViewCell_ID forIndexPath:indexPath ];
    
    cell.tyep = (int)self.layoutType;
    cell.vedioDelegate = self;
    cell.vediomode = self.vedioArray[indexPath.row];
    self.visibleIndexPaths = [self.collectionview indexPathsForVisibleItems];

       return cell;
}

-(void)requestdoteplayer
{
    [[PlayesRequest sharePlayerRequest]requestDoteStringleAllVedioWithID:self.autID success:^(NSDictionary *dic) {
       
    } failure:^(NSError *error) {
        
    }];
}


/****                  视频播放             ***/

//cell代理
-(void)vedioCollectionViewPlayBtnClicked:(VedioCollectionViewCell *)cell
{
   //获取当前行
    self.currentPath = [self.collectionview indexPathForCell:cell];
    self.currentCell = cell;
    if (self.playerview && self.isPlaying) {
        [self.playerview.players pause];//暂停
        [self.playerview removeFromSuperview];//移除
        self.isPlaying = NO;
    }
    VedioModel *mode = cell.vediomode;
    //根据Model的id去请求视频的url
    [[PlayesRequest sharePlayerRequest] requestDoteStringleAllVedioWithID:mode.ID success:^(NSDictionary *dic) {
        
        if (!self.isPlaying) {
      
            PlayerModel *pleamode = [[PlayerModel alloc]init];
            [pleamode setValuesForKeysWithDictionary:dic];
        //播放视频
        self.playerview = [[PlayerView alloc]initWithUrl:pleamode.url frame:cell.bounds];
        [cell.contentView addSubview:self.playerview];
            self.isPlaying = YES;
          }
    } failure:^(NSError *error) {
        
    }];
  
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //先把cell的坐标转换成屏幕的坐标
    CGRect chanageedFrame = [self.collectionview convertRect:self.currentCell.frame fromView:self.view];
   // NSLog(@"chanagedFrame == %@",NSStringFromCGRect(chanageedFrame));
    if (chanageedFrame.origin.y <= -chanageedFrame.size.height + 64 || chanageedFrame.origin.y >= WindowHeight) {
        [self putToRightCorner];
    }else
    {
        [self backToCell];//回到cell
    }
}

//当cell话出去 的时候放到右下角播放
-(void)putToRightCorner
{
    if (self.isPlaying) {
        [self.playerview removeFromSuperview];
        [self.view addSubview:self.playerview];
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rightframe = CGRectMake(WindownWidth/2.0, WindowHeight *3/4.0, WindownWidth, WindowHeight/4);
            self.playerview.frame = rightframe;
            //把这个layerview的frame也改变
            self.playerview.playerlayer.frame = self.playerview.bounds;
            [self.view addSubview:self.playerview];
        }];
    }
   
}
//回到cell
- (void)backToCell
{
    if ([self.visibleIndexPaths containsObject:self.currentPath]) {
        if (self.isPlaying) {
            [self.playerview removeFromSuperview];
            //然后把playerview 增加到这个cell上
            [UIView animateWithDuration:0.5 animations:^{
                self.playerview.frame = self.currentCell.bounds;
                self.playerview.playerlayer.frame = self.playerview.bounds;
                [self.currentCell.contentView addSubview: self.playerview];
                [self.currentCell.contentView bringSubviewToFront:self.playerview];
            }];
        }
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
