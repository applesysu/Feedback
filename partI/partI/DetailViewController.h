//
//  DetailViewController.h
//  ShowPage
//
//  Created by 03 developer on 12-9-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYSU_Client.h"

@interface DetailViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString *tid;
@property (strong, nonatomic) SYSU_Client *client;
@property (strong, nonatomic) NSArray *subject;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *reply;

@end
