//
//  MyPagesViewController.m
//  Feedback
//
//  Created by 01 developer on 12-9-11.
//  Copyright (c) 2012年 Apple Club. All rights reserved.
//

#import "MyPagesViewController.h"

@interface MyPagesViewController ()

@end

@implementation MyPagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    returnList=[[NSArray alloc] init];
    listData=[[NSMutableArray alloc] init];
    idList=[[NSMutableArray alloc] init];
    returnDir=[[NSDictionary alloc] init];
    client=[[SYSU_Client alloc] init];
    // 发送请求取得数组
    returnList=[client TidNum:@"6527"];
    // 第0个dir储存的就是楼主帖子信息
    returnDir=[returnList objectAtIndex:0];
    // 再把该dir加入要显示数据的list中
    [listData addObject:returnDir];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return [listData count];
}

//返回一个cell，即每一行所要显示的内容
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identify=@"MyCell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
    
    if(cell==nil)
        
    {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
        
    }
    
    NSUInteger row = [indexPath row];
    
    UILabel *subject=(UILabel *)[cell viewWithTag:1];
    
    UILabel *author=(UILabel *)[cell viewWithTag:2];
    
    // 显示listData中关于主题和作者的信息
    subject.text=[[listData objectAtIndex:row] objectForKey:@"subject" ];
    author.text=[[listData objectAtIndex:row] objectForKey:@"author" ];
    
    
    return cell;
}

//设置点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString * rowvalue=[listData objectAtIndex:row];
    NSString * message=[[NSString alloc] initWithFormat:@"你选择了%@",rowvalue];
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"注意！" message:message delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//设置列宽
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


@end
