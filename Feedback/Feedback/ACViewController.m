//
//  ACViewController.m
//  Feedback
//
//  Created by Jacob Pan on 12-9-10.
//  Copyright (c) 2012年 Apple Club. All rights reserved.
//
// SHit Shitc	

#import "ACViewController.h"
#import "ACTestObj.h"

@interface ACViewController ()

@end

@implementation ACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ACTestObj *obj = [[ACTestObj alloc] init];
    [obj printfHello];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
