//
//  SYSU_Client.m
//  SYSU_network_Demo_Login
//
//  Created by 王 瑞 on 12-9-6.
<<<<<<< HEAD
<<<<<<< HEAD
//  Copyright (c) 2012年 王 瑞. All rights reserved.
=======
//  Copyright (c) 2012年 Apple Club. All rights reserved.
>>>>>>> Dev
=======
//  Copyright (c) 2012年 Apple Club. All rights reserved.
>>>>>>> Dev
//

#import "SYSU_Client.h"
#import "JSONkit.h"

@implementation SYSU_Client

<<<<<<< HEAD
<<<<<<< HEAD
-(NSDictionary *)LoginName:(NSString *)name LoginPass:(NSString *)password{
    //使用的是DEMO
=======
=======
>>>>>>> Dev
/*
  登陆函数：参数为用户名和密码
  返回用户信息的Dictionary，内容包括：邮箱，是否为管理员，是否为学生，用户名，uid；
  方式：同步POST
*/

-(NSDictionary *)LoginName:(NSString *)name LoginPass:(NSString *)password{
    //使用的是正式板块
<<<<<<< HEAD
>>>>>>> Dev
=======
>>>>>>> Dev
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
<<<<<<< HEAD
<<<<<<< HEAD
//    NSLog(@"%d",returnjson.count);
    return returnjson;
}

=======
=======
>>>>>>> Dev

    return returnjson;
}

/*
    板块加载函数：参数为版块代号，页码数及每页帖子数
    返回Dictionary组成的Array,内涵帖子的基本信息，具体请参看文档或自己试验
    方法：同步POST
 
 */
<<<<<<< HEAD
>>>>>>> Dev
=======
>>>>>>> Dev
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
    
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> Dev
    return returnArray;
}

/*
    帖子加载函数：参数为帖子编号
    返回Dictionary组成的Array,提供楼主相关信息及回复信息，具体内容请参看文档或自己试验
    方法：同步POST
 */
-(NSArray *)TidNum:(NSString *)num{
    NSURL *url=[NSURL URLWithString:@"http://202.116.65.120/bbs/interface.php?action=viewThread"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    NSString *params=[[NSString alloc] initWithFormat:@"tid=%@",num];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    NSHTTPURLResponse *urlResponse=nil;
    NSError *error=[[NSError alloc] init];
    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSMutableString *str=[[NSMutableString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    [str deleteCharactersInRange:[str rangeOfString:@"\n\n\n\n"]];
    NSRange  range=NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@"\r\n" withString:@"" options:NSLiteralSearch range:range];
    responseData=[str dataUsingEncoding:NSUTF8StringEncoding];
        NSArray *returnArray=[responseData mutableObjectFromJSONData];
    return returnArray;
}
/*
    回帖函数：参数为版块代号，帖子代号，回帖内容
    返回-1，代表回帖失败，返回其它正值代表成功
    方法：同步POST
 */
<<<<<<< HEAD
>>>>>>> Dev
=======
>>>>>>> Dev

-(void)FidNum:(NSString *)num TidNum:(NSString *)tnum content:(NSString *)content{
    NSURL *url=[NSURL URLWithString:@"http://202.116.65.120/bbs/interface.php?action=reply"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    NSString *params=[[NSString alloc] initWithFormat:@"fid=%@&tid=%@&message=%@",num,tnum,content];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *urlResponse=nil;
    NSError *error=[[NSError alloc] init];
    NSData *responseData=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
<<<<<<< HEAD
<<<<<<< HEAD
//    NSString *str=[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",str);
=======

>>>>>>> Dev
=======

>>>>>>> Dev
    responseData=nil;
    
}

<<<<<<< HEAD
<<<<<<< HEAD

=======
=======
>>>>>>> Dev
/*
    发帖函数：参数为校区，版块代号，标题，正文
    返回帖子代号（tid）
    方法：同步POST
 
 */
<<<<<<< HEAD
>>>>>>> Dev
=======
>>>>>>> Dev
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



<<<<<<< HEAD
<<<<<<< HEAD

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
=======
>>>>>>> Dev
=======
>>>>>>> Dev
@end
