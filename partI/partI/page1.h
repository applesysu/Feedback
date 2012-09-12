//
//  page1.h
//  partI
//
//  Created by 04 developer on 12-9-10.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface page1 : UITableViewController < UITabBarDelegate , UITableViewDataSource >
@property (strong,nonatomic) NSArray *keys;
@property (strong,nonatomic)NSDictionary *names;

@end
