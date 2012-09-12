//
//  SYSU_Chardeal.h
//  SYSU_network_Demo_Login
//
//  Created by 王 瑞 on 12-9-11.
//  Copyright (c) 2012年 王 瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYSU_Chardeal : NSObject

-(NSData *)DealWithChar:(NSData *)data;

-(NSString *)DeletaExtraCode:(NSString *)code;
@end
