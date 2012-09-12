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
//      NSLog(@"%@",str);
//    [str deleteCharactersInRange:[str rangeOfString:@"\n\n\n\n"]];
     NSRange  range=NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@"\r" withString:@"" options:NSLiteralSearch range:range];
    range=NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range];
    range=NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@"\t" withString:@"" options:NSLiteralSearch range:range];
    range=NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@":p" withString:@"" options:NSLiteralSearch range:range];
     NSLog(@"%@",str);
    data=[str dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

//-(NSString *)DeletaExtraCode:(NSString *)code{
//    NSError *error=NULL;
//    NSString *
//}
@end
