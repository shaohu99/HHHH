//
//  AuthorsViewController.m
//  LessonVedio
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 ZSH. All rights reserved.
//

#import "AuthorsViewController.h"
#import "AnchTableViewCell.h"
#import "AutorhtRequest.h"
#import "AuthorMode.h"
#import "VediosViewController.h"
@interface AuthorsViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate,
    UIScrollViewDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *dotatableview;
@property (weak, nonatomic) IBOutlet UITableView *loltableview;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
//解析数组
@property(nonatomic,strong) NSMutableArray *doteArray;
@property(nonatomic,strong) NSMutableArray *lolArray;
@end

@implementation AuthorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.doteArray = [NSMutableArray array];
    self.lolArray = [NSMutableArray array];
    [self.dotatableview registerNib:[UINib nibWithNibName:@"AnchTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AnchTableViewCell_ID];
    
   [self.loltableview registerNib:[UINib nibWithNibName:@"AnchTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AnchTableViewCell_ID];
//    NSLog(@"2");
    //请求
    [self requestDoteAuthors];
    [self requestLOLAuthors];
    self.segmented.selectedSegmentIndex = 0;
    [self.segmented addTarget:self action:@selector(doSomethingInSegment:) forControlEvents:UIControlEventPrimaryActionTriggered];
    self.scrollview.delegate = self;
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.rootVC.vediotabbar.hidden = NO;
}
-(void)doSomethingInSegment:(UISegmentedControl *)segment{
    NSInteger index = segment.selectedSegmentIndex;
    
    switch (index) {
        case 0:{
            self.scrollview.contentOffset = CGPointMake(0, 0);
            self.segmented.selectedSegmentIndex = 0;
            break;
        }
        case 1:{
            self.scrollview.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
            self.segmented.selectedSegmentIndex = 1;
            break;
        }
        default:
            break;
    }
    
}
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//   self.segmented.selectedSegmentIndex = self.scrollview.contentOffset.x / self.scrollview.frame.size.width;
//}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.segmented.selectedSegmentIndex = self.scrollview.contentOffset.x / self.scrollview.frame.size.width;

}
//请求
-(void)requestDoteAuthors{
    __weak typeof(self)weakself = self;
    [[AutorhtRequest shareAuthorRequest]requestDoteAllAuthorsSuccess:^(NSDictionary *dic) {
        //NSLog(@"dote dic = %@",dic);
        weakself.doteArray = [AuthorMode parseAuthorsWithDic:dic];
       dispatch_async(dispatch_get_main_queue(), ^{
           [weakself.dotatableview reloadData];
            //NSLog(@"%p",weakself.doteArray);
       });
        
    } failure:^(NSError *error) {
        //NSLog(@"dote error= %@",error);
    }];
}
-(void)requestLOLAuthors{
    
    __weak typeof (self)weakself = self;
   [[AutorhtRequest shareAuthorRequest]requestAllLoLSuccess:^(NSDictionary *dic) {
       weakself.lolArray = [AuthorMode parseAuthorsWithDic:dic];
      // NSLog(@"%@",dic);
       //NSLog(@"%ld  救护",weakself.lolArray.count);
       dispatch_async(dispatch_get_main_queue(), ^{
           [weakself.loltableview reloadData];
           
       });
   } failure:^(NSError *error) {
       //NSLog(@"dote error= %@",error);
   }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.dotatableview) {
        return self.doteArray.count;
    }else {
       return self.lolArray.count;
       

    }
    
    }

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     AnchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AnchTableViewCell_ID];
    AuthorMode *mode = nil;
    if (tableView == self.dotatableview) {
     mode = self.doteArray[indexPath.row];
    }else{

        mode = self.lolArray[indexPath.row];
    }
    cell.mode = mode;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    VediosViewController *vedionVC = [sb instantiateViewControllerWithIdentifier:@"VediosViewController"];
    AuthorMode *mode = nil;
    if (tableView == self.dotatableview) {
        mode = self.doteArray[indexPath.row];
        vedionVC.autID = mode.authorID;
        vedionVC.sourcefrom = 0;
        self.rootVC.vediotabbar.hidden = YES;
        
    }else{
        mode = self.lolArray[indexPath.row];
        vedionVC.autID = mode.authorID;
        vedionVC.sourcefrom = 1;
        self.rootVC.vediotabbar.hidden = YES;
    }
    
    [self.navigationController pushViewController:vedionVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
