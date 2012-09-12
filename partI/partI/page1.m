//
//  page1.m
//  partI
//
//  Created by 04 developer on 12-9-10.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import "page1.h"

@implementation page1
@synthesize names;
@synthesize keys;
-(void)viewDidLoad
{
    [super viewDidLoad];
     // Do any additional setup after loading the view, typically from a nib.
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *plistPath = [bundle pathForResource:@"partlist" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    self.names=dict;
    
    NSArray *array = [[names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.keys = array;
        
}

-(void)viewDidUnLoad
{
    [super viewDidUnload];
    self.names = nil;
    self.keys = nil;
    
}

#pragma mark _
#pragma mark Table View Data Source Methods
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [keys count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    return [nameSection count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    
    static NSString *SectionTableIdentifier = @"SectionTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionTableIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SectionTableIdentifier];
        
    }
    
    cell.textLabel.text = [[nameSection objectAtIndex:row] objectForKey:@"name"];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = [keys objectAtIndex:section];
    return key;
}
        
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
        
    NSNumber *name = [[nameSection objectAtIndex:row] objectForKey:@"name"];
    
    UIViewController *childController =
    
    [[UIViewController alloc] init];
    
    childController.title = [name stringValue];
    
    //childController.labelName = name;
    
//    [self.navigationController pushViewController:childController animated:YES];    
    [self performSegueWithIdentifier:@"FToT" sender:self];
  
}

#pragma mark -
#pragma mark Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UITableViewController *destination = segue.destinationViewController;
   // UITableView *tableView = [self.tableView];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    NSString *name = [keys objectAtIndex:path.row];
    NSString *fid = [names objectForKey:name];
    [destination setValue:fid forKey:@"fid"];
}

@end
