//
//  SYSU_Chardeal.h
//  SYSU_network_Demo_Login
//
//  Created by 王 瑞 on 12-9-11.
//  Copyright (c) 2012年 王 瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYSU_Chardeal : NSObject

-(NSData *)DealWithChar:(NSData *)data getFid:(NSString *)fid;




/* 用途：去除回复的字符串无用的部分
 
    参数："key:" message" 下的字符串
 
    返回：回复的重要部分
 
    例如："message":"[b]回复 [url=http://iforum.sysu.edu.cn/redirect.php?goto=findpost&pid=8908&ptid=1765]12#[/url] [i]gongwt[/i] [/b]    头像是女的，不代表性别也是女的"-------------将去掉[b]••••••[/b]部分，只剩下("头像是女的，不代表性别也是女的")部分
 
 */
-(NSMutableString *)DeletaExtraCode:(NSString *)code getFid:(NSString *)fid;



@end
