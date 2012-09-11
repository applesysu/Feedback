//
//  SYSU_Client.h
//  SYSU_network_Demo_Login
//
//  Created by 王 瑞 on 12-9-6.
<<<<<<< HEAD
<<<<<<< HEAD
//  Copyright (c) 2012年 王 瑞. All rights reserved.
=======
//  Copyright (c) 2012年  Apple Club. All rights reserved.
>>>>>>> Dev
=======
//  Copyright (c) 2012年  Apple Club. All rights reserved.
>>>>>>> Dev
//

// branch

#import <Foundation/Foundation.h>

@interface SYSU_Client : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>{
    NSURLConnection *connection;
    NSMutableData *returnData;

}

-(NSDictionary *)LoginName:(NSString *)name LoginPass:(NSString *)password;
-(NSArray *)FidNum:(NSString *)num Page:(NSString *)page NumPerPage:(NSString *)numPerPage;
-(NSArray *)TidNum:(NSString *)num;
-(void)FidNum:(NSString *)num TidNum:(NSString *)tnum content:(NSString *)content;
-(NSString *)SchoolArea:(NSString *)area Blocks:(NSString *)block  head:(NSString *)head content:(NSString *)content;
@end
