//
//  MyPagesViewController.h
//  Feedback
//
//  Created by 01 developer on 12-9-11.
//  Copyright (c) 2012年 Apple Club. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYSU_Client.h"
@interface MyPagesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * returnList;  //发送请求后返回的数组
    NSMutableArray *listData;  //用于显示数据道数组
    NSMutableArray *idList; //储存我发过道帖子的id的数组
    NSDictionary *returnDir; //取得楼主帖子信息的dir
    SYSU_Client *client;
}

@end
