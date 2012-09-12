//
//  ACViewController.m
//  Feedback
//
//  Created by Jacob Pan on 12-9-10.
//  Copyright (c) 2012年 Apple Club. All rights reserved.
//

#import "ACViewController.h"

@interface ACViewController ()

@end

@implementation ACViewController
@synthesize tf_user;
@synthesize tf_password;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //初始化
    client=[[SYSU_Client alloc] init];
    userDefaults = [NSUserDefaults standardUserDefaults];
}

- (void)viewDidUnload
{
    [self setTf_user:nil];
    [self setTf_password:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)ToLogin:(id)sender {
    NSString *user=[tf_user text];
    NSString *password=[tf_password text];
    NSDictionary *returnDir=[[NSDictionary alloc] init];
    //进行登陆
    returnDir=[client LoginName:user LoginPass:password];
    //如果登陆成功
    if(returnDir!=nil)
    {
        //把当前用户名保存
        [userDefaults setValue:user forKey:@"user"];
        //跳转
        [self performSegueWithIdentifier:@"toLogin" sender:self];
    }
    else
    {
        //null表示当前没有登陆
        [userDefaults setValue:@"null" forKey:@"user"];
        //提示框
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"注意！" message:@"登陆失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
        [alert show];

    }
        
    
}
- (IBAction)ForTourist:(id)sender {
    //null表示当前没有登陆
    [userDefaults setValue:@"null" forKey:@"user"];
    [self performSegueWithIdentifier:@"toLogin" sender:self];
}
@end
