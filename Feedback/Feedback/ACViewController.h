//
//  ACViewController.h
//  Feedback
//
//  Created by 晏榆 on 12-9-10.
//  Copyright (c) 2012年 Apple Club. All rights reserved.
//
// test git
// test agian


#import <UIKit/UIKit.h>
#import "SYSU_Client.h"
@interface ACViewController : UIViewController
{
    SYSU_Client *client;
    NSUserDefaults *userDefaults;
}
@property (weak, nonatomic) IBOutlet UITextField *tf_user;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;
- (IBAction)ToLogin:(id)sender;

//点击背景隐藏输入法
- (IBAction)backgroundTap:(id)sender;
//按done跳到下一个框
- (IBAction)moveToPasswordField:(id)sender;
//游客请进
- (IBAction)ForTourist:(id)sender;

@end
