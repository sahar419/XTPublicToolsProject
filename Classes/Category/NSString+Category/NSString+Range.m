//
//  NSString+Range.m
//  MyFramework
//
//  Created by 张发政 on 2017/1/12.
//  Copyright © 2017年 zhangfazheng. All rights reserved.
//

#import "NSString+Range.h"

@implementation NSString (Range)

- (NSArray <NSValue *> *)rangesOfString:(NSString *)searchString options:(NSStringCompareOptions)mask serachRange:(NSRange)range {
    
    NSMutableArray *array = [NSMutableArray array];
    [self rangeOfString:searchString range:NSMakeRange(0, self.length) array:array options:mask];
    
    return array;
}

- (void)rangeOfString:(NSString *)searchString
                range:(NSRange)searchRange
                array:(NSMutableArray *)array
              options:(NSStringCompareOptions)mask {
    
    NSRange range = [self rangeOfString:searchString options:mask range:searchRange];
    
    if (range.location != NSNotFound) {
        
        [array addObject:[NSValue valueWithRange:range]];
        [self rangeOfString:searchString
                      range:NSMakeRange(range.location + range.length, self.length - (range.location + range.length))
                      array:array
                    options:mask];
    }
}

+ (NSString *)countNumAndChangeformat:(NSString *)num

{
    
    //整数
    NSString* str11;
    
    //小数点之后的数字
    
    NSString* str22;
    
    
    
    if ([num containsString:@"."]) {
        
        NSArray* array = [num componentsSeparatedByString:@"."];
        
        
        
        str11 = array[0];
        
        str22 = array[1];
        
        
        
    }else{
        
        
        
        str11 = num;
        
    }
    
    
    
    
    
    int count = 0;
    
    long long int a = str11.longLongValue;
    
    while (a != 0)
        
    {
        
        count++;
        
        a /= 10;
        
    }
    
    NSMutableString *string = [NSMutableString stringWithString:str11];
    
    NSMutableString *newstring = [NSMutableString string];
    
    while (count > 3) {
        
        count -= 3;
        
        NSRange rang = NSMakeRange(string.length - 3, 3);
        
        NSString *str = [string substringWithRange:rang];
        
        [newstring insertString:str atIndex:0];
        
        [newstring insertString:@"," atIndex:0];
        
        [string deleteCharactersInRange:rang];
        
    }
    
    [newstring insertString:string atIndex:0];
    
    
    
    if ([num containsString:@"."]) {
        
        //包含小数点
        
        //返回的数字
        
        NSString* str33;
        
        
        
        if (str22.length>0) {
            
            //小数点后面有数字
            
            
            
            str33 = [NSString stringWithFormat:@"%@.%@",newstring,str22];
            
        }else{
            
            //没有数字
            
            str33 = [NSString stringWithFormat:@"%@",newstring];
            
        }
        
        return str33;
        
        
        
    }else{
        
        
        
        //不包含小数点
        
        return newstring;
        
    }
    
    
    
}

+ (NSString *)countStringAndChangeformat:(NSString *)string sapce:(NSString *)space count:(NSInteger) count{
    NSString *tempStr=string;
    
    NSInteger size =(tempStr.length / count);
    
    
    
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    
    for (int n = 0;n < size; n++)
        
    {
        
        [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(n*count, count)]];
        
    }
    
    
    
    [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(size*count, (tempStr.length % count))]];
    
    
    
    tempStr = [tmpStrArr componentsJoinedByString:space];
    
    
    
    return tempStr;
}


@end
