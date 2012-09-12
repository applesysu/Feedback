//
//  post.m
//  发帖页面
//
//  Created by lulu on 12-9-10.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import "post.h"

@implementation post
@synthesize tableView;
@synthesize mytitle;
@synthesize detail;
#define kNumberOfSections 2

enum {
    kSection1 = 0,
    kSection2
};

// including the dropdown cell !!
/* set to 3 if you want to see how it behaves 
 when having more cells in the same section 
 */
#define kNumberOfRowsInSection1 3 

enum {
    kRowDropDownSelection = 0,
    kRowDropDownDisclosure,    
    kRow1
};


/* set to 2 if you want to see how it behaves 
 when having more cells in the same section 
 */

#define kNumberOfRowsInSection2 1
enum {
    kRowDropDownCustom = 0,
    kS2Row1
};


- (id)initWithStyle:(UITableViewStyle)style
{
    //self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _dropDownSelection = [[VPPDropDown alloc] initSelectionWithTitle:@"Selection Combo"
                                                              tableView:self.tableView
                                                               indexPath:[NSIndexPath indexPathForRow:kRowDropDownSelection inSection:kSection1] 
                                                                delegate:self 
                                                           selectedIndex:1
                                                           elementTitles:@"Option 1", @"Option 2", @"Option 3", nil];
        
            
    }return self;
}

/*- (void) dealloc {
    
    if (_dropDownSelection != nil) {
        [_dropDownSelection release];
        _dropDownSelection = nil;
    }
    //[super dealloc];
}*/
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
//    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [self setDetail:nil];
    [self setTitle:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case kSection2:
            if (indexPath.row > 0) {
                return [VPPDropDown tableView:self.tableView heightForRowAtIndexPath:indexPath];
            }
            
        default:
            break;
    }
    
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return kNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int rows = [VPPDropDown tableView:self.tableView numberOfExpandedRowsInSection:section];
    switch (section) {
        case kSection1:
            rows += kNumberOfRowsInSection1;
            break;
        case kSection2:
            rows += kNumberOfRowsInSection2;
            break;
            
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        /*cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ];*/
    }
    
    
    // Configure the cell...
    cell.textLabel.text = nil;
    
    if ([VPPDropDown tableView:self.tableView dropdownsContainIndexPath:indexPath]) {
        return [VPPDropDown tableView:self.tableView cellForRowAtIndexPath:indexPath];
    }
    
    // first check if any dropdown contains the requested cell
    int row = indexPath.row - [VPPDropDown tableView:self.tableView numberOfExpandedRowsInSection:indexPath.section];
    switch (indexPath.section) {
        case kSection1:
            switch (row) {
                case kRow1:
                    cell.textLabel.text = @"This is an independent cell";
                    break;
            }
            break;
        case kSection2:
            switch (row) {
                case kS2Row1:
                    cell.textLabel.text = @"This is an independent cell";
                    break;
            }
            break;
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    
    // first check if any dropdselfown contains the requested cell
    if ([VPPDropDown tableView:self.tableView dropdownsContainIndexPath:indexPath]) {
        [VPPDropDown tableView:self.tableView didSelectRowAtIndexPath:indexPath];
        return;
    }
    
    int row = indexPath.row - [VPPDropDown tableView:self.tableView numberOfExpandedRowsInSection:indexPath.section];
    UIAlertView *av;
    switch (indexPath.section) {
        case kSection1:
            switch (row) {
                case kRow1:
                    av = [[UIAlertView alloc] initWithTitle:@"Cell selected" message:@"The independent cell 1 has been selected" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [av show];
                    //[av release];
                    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
                    break;
                    
                default:
                    break;
            }
            
            
            break;
            
        case kSection2:
            switch (row) {
                case kS2Row1:
                    av = [[UIAlertView alloc] initWithTitle:@"Cell selected" message:@"The independent cell 2 has been selected" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [av show];
                    //[av release];
                    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
                    break;
                    
                default:
                    break;
            }
            
            break;
    }
    
}


#pragma mark - VPPDropDownDelegate


- (UITableViewCell *) dropDown:(VPPDropDown *)dropDown rootCellAtGlobalIndexPath:(NSIndexPath *)globalIndexPath {
    
    return nil;
}
- (UITableViewCell *) dropDown:(VPPDropDown *)dropDown cellForElement:(VPPDropDownElement *)element atGlobalIndexPath:(NSIndexPath *)globalIndexPath {
    static NSString *cellIdentifier = @"CustomDropDownCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
      //  cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.textLabel.text = @"Custom cell";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"row %d",globalIndexPath.row];
    
    return cell;
}


- (CGFloat) dropDown:(VPPDropDown *)dropDown heightForElement:(VPPDropDownElement *)element atIndexPath:(NSIndexPath *)indexPath {
    float height = dropDown.tableView.rowHeight;
    
    return height + indexPath.row * 10;
}


#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (_ipToDeselect != nil) {
        [self.tableView deselectRowAtIndexPath:_ipToDeselect animated:YES];
        //[_ipToDeselect release];
        _ipToDeselect = nil;
    }
}

- (IBAction)backgroundTap:(id)sender{
    
    [self.mytitle resignFirstResponder];
    [self.detail resignFirstResponder];
}

- (IBAction)close:(id)sender {
    [self.mytitle resignFirstResponder];

}

@end
