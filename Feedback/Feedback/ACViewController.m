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
@synthesize indicator_login;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //初始化
    client=[[SYSU_Client alloc] init];
    userDefaults = [NSUserDefaults standardUserDefaults];
 
    //先把indicator隐藏
    [indicator_login setHidden:YES];
}

- (void)viewDidUnload
{
    [self setTf_user:nil];
    [self setTf_password:nil];
    [self setIndicator_login:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)backgroundTap:(id)sender {
    [tf_user resignFirstResponder];
    [tf_password resignFirstResponder];
}   //点击背景隐藏键盘,要讲背景view的class从uiview改成uicontrol，然后把它的touch down方法连到该函数
- (IBAction)moveToPasswordField:(id)sender {
    [tf_user resignFirstResponder];
    [tf_password becomeFirstResponder];
}  //点击done跳到下一个框，要连接textview的Did End On Exit  event到该函数
- (IBAction)ToLogin:(id)sender {
    NSString *user=[tf_user text];
    NSString *password=[tf_password text];
    NSDictionary *returnDir=[[NSDictionary alloc] init];
    //帐号密码没有填写
    if([user isEqual:@""] || [password isEqual:@""])
    {
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"注意！" message:@"请输入帐号密码" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
        [alert show];

    }
    else
    {
        //show indicator
        [indicator_login setHidden:NO];
        [indicator_login startAnimating];
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
        //close indicator
        [indicator_login stopAnimating];
        [indicator_login setHidden:YES];
    }
    
}
- (IBAction)ForTourist:(id)sender {
    //null表示当前没有登陆
    [userDefaults setValue:@"null" forKey:@"user"];
    [self performSegueWithIdentifier:@"toLogin" sender:self];
}
@end
