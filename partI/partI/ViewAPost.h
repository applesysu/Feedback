//
//  ViewAPost.h
//  partI
//
//  Created by 04 developer on 12-9-12.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewAPost : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *author;
@property (strong, nonatomic) IBOutlet UIImageView *author_image;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UITextView *content;
@property (strong, nonatomic) IBOutlet UITextField *reply;

- (IBAction)backgroundTap:(id)sender;
@end
