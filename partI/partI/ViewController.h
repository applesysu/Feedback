//
//  ViewController.h
//  partI
//
//  Created by 04 developer on 12-9-10.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *psw;
- (IBAction)login:(id)sender;
- (IBAction)closeinput:(id)sender;


@end
