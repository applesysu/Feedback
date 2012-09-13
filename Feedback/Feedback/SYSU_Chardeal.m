//
//  SYSU_Chardeal.m
//  SYSU_network_Demo_Login
//
//  Created by 王 瑞 on 12-9-11.
//  Copyright (c) 2012年 王 瑞. All rights reserved.
//

#import "SYSU_Chardeal.h"

@implementation SYSU_Chardeal

-(NSData *)DealWithChar:(NSData *)data getFid:(NSString *)fid{
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
    range=NSMakeRange(0, [str length]);
    [str replaceOccurrencesOfString:@":hug:" withString:@"" options:NSLiteralSearch range:range];
//     NSLog(@"%@",str);
   SYSU_Chardeal *chardeal=[[SYSU_Chardeal alloc] init];
    str=[chardeal DeletaExtraCode:str getFid:fid];
//    NSLog(@"%@",str);
    data=[str dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

-(NSMutableString *)DeletaExtraCode:(NSString *)code getFid:(NSString *)fid{
    NSError *error=NULL;
    NSMutableString *string=[[NSMutableString alloc] initWithString:code];
    //删掉 [size][/size][color][/color][p][/p][font][/font]
    NSRegularExpression *  regex=[NSRegularExpression regularExpressionWithPattern:@"([\\[]color.[^]]*])|([\\[]font.[^]]*])|([\\[]size.[^]]*])|([\\[]/size])|([\\[]/font])|([\\[]/color])|([\\[]p.[^]]*])|([\\[]/p])|([\\[]tr.[^]]*])|([\\[]/tr])|([\\[]table.[^]]*])|([\\[]/table])|([\\[]td.[^]]*])|([\\[]/td])" options:NSRegularExpressionCaseInsensitive error:&error];
    [regex replaceMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];
    //删掉 [i]•••••[/i]
    regex=[NSRegularExpression regularExpressionWithPattern:@"[\\[]i.[^\\[]*[\\[]/i]" options:NSRegularExpressionCaseInsensitive error:&error];
    [regex replaceMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];

    //删掉[url]••••••[/url]
    if((![fid isEqualToString:@"167"])&&(![fid isEqualToString:@"201"]))
    {
    regex=[NSRegularExpression regularExpressionWithPattern:@"[\\[]url.[^\\[]*[\\[]/url]" options:NSRegularExpressionCaseInsensitive error:&error];
    [regex replaceMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];
    }
//    NSRange rangeOfFirstMatch=[regex rangeOfFirstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
//    if (!NSEqualRanges(rangeOfFirstMatch, NSMakeRange(NSNotFound, 0))) {
//        NSString *substringForFirstMatch=[string substringWithRange:rangeOfFirstMatch];
//        NSRange range=NSMakeRange(0, [string length]);
//        [string replaceOccurrencesOfString:substringForFirstMatch withString:@"" options:NSLiteralSearch range:range];
//    }
    //删除 [attach]••••••[/attach]
    regex=[NSRegularExpression regularExpressionWithPattern:@"[\\[]attach.[^\\[]*[\\[]/attach]" options:NSRegularExpressionCaseInsensitive error:&error];
    [regex replaceMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];

    //删掉[b]•••••[/b]
    regex=[NSRegularExpression regularExpressionWithPattern:@"[\\[]b.[^\\[]*[\\[]/b]" options:NSRegularExpressionCaseInsensitive error:&error];
    [regex replaceMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];
    


//    rangeOfFirstMatch=[regex rangeOfFirstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
//    if (!NSEqualRanges(rangeOfFirstMatch, NSMakeRange(NSNotFound, 0))) {
//        NSString *substringForFirstMatch=[string substringWithRange:rangeOfFirstMatch];
//        NSRange range=NSMakeRange(0, [string length]);
//        [string replaceOccurrencesOfString:substringForFirstMatch withString:@"" options:NSLiteralSearch range:range];
//     }
   
    return string;

}
@end
