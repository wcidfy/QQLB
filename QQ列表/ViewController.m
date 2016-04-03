//
//  ViewController.m
//  QQ列表
//
//  Created by lxx on 16/2/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *dateList;
//分组展开折叠状态
//@property(nonatomic,strong)NSMutableDictionary *sectionState;
//标题分组保存数组
@property(nonatomic,strong)NSMutableDictionary *sectionDict;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    初始化数据
    NSString *path=[[NSBundle mainBundle]pathForResource:@"friends" ofType:@"plist"];
    self.dateList=[NSArray arrayWithContentsOfFile:path];


    [self.tableView setRowHeight:44];
    [self.tableView setSectionHeaderHeight:44];
//    初始化展开折叠数组
//    self.sectionState=[NSMutableDictionary dictionaryWithCapacity:self.dateList.count];
//
//    for (NSInteger section=0; section<self.dateList.count; section++) {
//        [self.sectionState setObject:@(0) forKey:@(section)];
//    }
//
//    NSLog(@"%@",self.sectionState);
    self.sectionDict=[NSMutableDictionary dictionaryWithCapacity:self.dateList.count];

}



#pragma make -数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return self.dateList.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    如果是折叠状态返回0 否则返回数组数量
//    BOOL isOpen=[self.sectionState[@(section)]boolValue];
    MyHeadView *headView=self.sectionDict[@(section)];
    if (headView.isOpen) {
            NSDictionary *dict=self.dateList[section];
            NSArray *arr=dict[@"friends"];
            return arr.count;
    }else
    {
        return 0;
    
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"Mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==Nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSDictionary *dict=self.dateList[indexPath.section];
    NSArray *arr=dict[@"friends"];
    [cell.textLabel setText:arr[indexPath.row]];
    return cell;
}
#pragma make -表格标题栏
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *HeadId=@"HeadID";
//    MyHeadView *headView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:HeadId];
    MyHeadView *headView=self.sectionDict[@(section)];
    if (headView==nil) {
        headView=[[MyHeadView alloc]initWithReuseIdentifier:HeadId];
        headView.delegate=self;
        [self.sectionDict setObject:headView forKey:@(section)];
    }
    NSDictionary *dic=self.dateList[section];
    NSString *groupName=dic[@"group"];
    [headView.button setTitle:groupName forState:UIControlStateNormal];
    //记录对应的分组
    [headView setSection:section];
    return headView;
}

#pragma make -分组上按钮点击
-(void)didClickHeadView:(MyHeadView *)myHeadview
{
    NSLog(@"点击按钮%d",myHeadview.section );
//    BOOL isOpen=[self.sectionState[@(myHeadview.section)]boolValue];
//    [self.sectionState setObject:@(!isOpen) forKey:@(myHeadview.section)];
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:myHeadview.section] withRowAnimation:UITableViewRowAnimationFade];
    
    BOOL isOpen=myHeadview.isOpen;
    [myHeadview setIsOpen:!isOpen];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:myHeadview.section] withRowAnimation:UITableViewRowAnimationFade];

}

@end
