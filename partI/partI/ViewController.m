//
//  ViewController.m
//  partI
//
//  Created by 04 developer on 12-9-10.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import "ViewController.h"
#import "SYSU_Client.h"

@implementation ViewController
@synthesize username;
@synthesize psw;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setUsername:nil];
    [self setPsw:nil];
    [super viewDidUnload];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [username setText:[userDefault stringForKey:@"username"]];
    [psw setText:[userDefault stringForKey:@"password"]];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    //Save the data
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:self.username.text forKey:@"username"];
    [userDefault setValue:self.psw.text forKey:@"password"];

	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//判断用户是否存在，如果有这个用户，则可以正常登录，否则弹出对话框告诉用户不能登录
//@param username 用户名
//@param psw 密码
- (IBAction)login:(id)sender {
    
    SYSU_Client *newClient = [[SYSU_Client alloc] init];
    NSDictionary *client = [newClient LoginName:self.username.text LoginPass:self.psw.text];
    if ([(NSString*)[client objectForKey:@"username"] isEqualToString:[username text]] ) {
        [self performSegueWithIdentifier:@"login" sender:self];
    } else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"I am sorry" message:@"The user or the password have some error, please check them all" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [self setUsername:nil];
        [self setUsername:nil];         
    }
}
-(IBAction)closeinput:(id)sender{
    [self.username resignFirstResponder];
    [self.psw resignFirstResponder];
}
@end
