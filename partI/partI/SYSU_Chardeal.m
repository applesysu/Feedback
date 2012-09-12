//
//  SYSU_Chardeal.m
//  SYSU_network_Demo_Login
//
//  Created by 王 瑞 on 12-9-11.
//  Copyright (c) 2012年 王 瑞. All rights reserved.
//

#import "SYSU_Chardeal.h"

@implementation SYSU_Chardeal

-(NSData *)DealWithChar:(NSData *)data{
    NSMutableString *str=[[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
      NSLog(@"%@",str);
    [str deleteCharactersInRange:[str rangeOfString:@"\n\n\n\n"]];
    NSRange  range=NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@"\r\n" withString:@"" options:NSLiteralSearch range:range];
    range=NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@"\n\n" withString:@"" options:NSLiteralSearch range:range];
    data=[str dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}
@end
