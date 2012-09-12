//
//  post.h
//  发帖页面
//
//  Created by lulu on 12-9-10.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VPPDropDown.h"
#import "VPPDropDownDelegate.h"

@interface post : UIViewController<VPPDropDownDelegate, UIActionSheetDelegate> {
@private
    VPPDropDown *_dropDownSelection;
    NSIndexPath *_ipToDeselect;
}
@property (strong, nonatomic) IBOutlet UITextField *mytitle;
@property (strong, nonatomic) IBOutlet UITextView *detail;

//- (IBAction)post:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)close:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
