//
//  ViewAPost.m
//  partI
//
//  Created by 04 developer on 12-9-12.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import "ViewAPost.h"

@implementation ViewAPost
@synthesize title;
@synthesize author;
@synthesize author_image;
@synthesize date;
@synthesize content;
@synthesize reply;

- (void)viewDidUnload {
    [self setTitle:nil];
    [self setAuthor:nil];
    [self setDate:nil];
    [self setContent:nil];
    [self setAuthor_image:nil];
    [self setReply:nil];
    [super viewDidUnload];
}

- (IBAction)backgroundTap:(id)sender{
    
    [self.content resignFirstResponder];
    [self.reply resignFirstResponder];
}
@end
