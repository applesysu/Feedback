//
//  SYSU_Client.m
//  SYSU_network_Demo_Login
//
//  Created by 王 瑞 on 12-9-6.
//  Copyright (c) 2012年 王 瑞. All rights reserved.
//

#import "SYSU_Client.h"
#import "JSONkit.h"

@implementation SYSU_Client

-(NSDictionary *)LoginName:(NSString *)name LoginPass:(NSString *)password{
    //使用的是DEMO
    NSURL *url=[NSURL URLWithString:@"http://202.116.65.120/bbs/interface.php?action=login"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //初始化参数
    NSString *params=[[NSString alloc] initWithFormat:@"user=%@&pwd=%@",name,password];
    //设置方法和参数
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *urlResponse=nil;
    NSError *error=[[NSError alloc] init];
    //使用同步POST
    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
   
    NSDictionary *returnjson=[[NSDictionary alloc] init];
    //使用json库（如果JSON里有数组，就用mutableObjectFromJSONData，返回array；负责使用objectFromJSONData，返回dictionary）
    returnjson=[responseData objectFromJSONData];
//    NSLog(@"%d",returnjson.count);
    return returnjson;
}

-(NSArray *)FidNum:(NSString *)num Page:(NSString *)page NumPerPage:(NSString *)numPerPage{
    NSURL *url=[NSURL URLWithString:@"http://202.116.65.120/bbs/interface.php?action=getThreads"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    NSString *params=[[NSString alloc] initWithFormat:@"fid=%@&page=%@&numPerPage=%@",num,page,numPerPage];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *urlResponse=nil;
    NSError *error=[[NSError alloc] init];
    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];

    
   NSArray *returnArray=[[NSArray alloc] init];

    returnArray=[responseData  mutableObjectFromJSONData];
    
//    NSLog(@"%d",returnArray.count);
    return returnArray;
}


//-(NSArray *)TidNum:(NSString *)num{
//    NSURL *url=[NSURL URLWithString:@"http://202.116.65.120/bbs/interface.php?action=viewThread"];
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
//    
//    NSString *params=[[NSString alloc] initWithFormat:@"tid=%@",num];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
//    NSHTTPURLResponse *urlResponse=nil;
//    NSError *error=[[NSError alloc] init];
//    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
//    NSString *str=[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",str);
//    
//    NSArray *returnArray=[responseData mutableObjectFromJSONData];
//  
//   NSLog(@"LL%d",returnArray.count);
//    return returnArray;
//}

-(void)FidNum:(NSString *)num TidNum:(NSString *)tnum content:(NSString *)content{
    NSURL *url=[NSURL URLWithString:@"http://202.116.65.120/bbs/interface.php?action=reply"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    NSString *params=[[NSString alloc] initWithFormat:@"fid=%@&tid=%@&message=%@",num,tnum,content];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *urlResponse=nil;
    NSError *error=[[NSError alloc] init];
    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
//    NSString *str=[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",str);
    responseData=nil;
    
}


-(NSString *)SchoolArea:(NSString *)area Blocks:(NSString *)block head:(NSString *)head content:(NSString *)content
{
    NSURL *url = [NSURL URLWithString:@"http://202.116.65.120/bbs/interface.php?action=releaseThread"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *params = [[NSString alloc] initWithFormat:@"type=%@&fid=%@&subject=%@&message=%@", area, block, head, content];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData * responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSDictionary *returnDictionary = [[NSDictionary alloc] init];
    returnDictionary = (NSDictionary *)[responseData mutableObjectFromJSONData];
    return [returnDictionary valueForKey:@"tid"];
}




//#pragma mark- Delegate
//-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
//    NSLog(@"connect success");
//    [returnData setLength:0];
//}
//
//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    NSString *str1=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
////    NSLog(@"%@",str);
////    str1=str1;
////    NSLog(@"%@",str);
//}
@end
