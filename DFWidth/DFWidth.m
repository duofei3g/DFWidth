
//
//  DFWidth.m DF  = duofei
//  NewFloodControl
//
//  Created by 软件技术中心 on 2017/5/19.
//  Copyright © 2017年 duofei. All rights reserved.
//

#import "DFWidth.h"


@implementation DFWidth

+(NSInteger)CompareBegin:(NSString *)begin end:(NSString *)end{
    NSInteger num = 100;
    NSDate *bTM;
    NSDate *eTM;
    if (begin.length==10&&end.length==10) {
        bTM =  [NSDate date:[begin substringWithRange:NSMakeRange(0, 10)] WithFormat:@"yyyy-MM-dd"];
        eTM =  [NSDate date:[end substringWithRange:NSMakeRange(0, 10)] WithFormat:@"yyyy-MM-dd"];
    }else{
        bTM =  [NSDate date:[begin substringWithRange:NSMakeRange(0, 13)] WithFormat:@"yyyy-MM-dd HH"];
        eTM =  [NSDate date:[end substringWithRange:NSMakeRange(0, 13)] WithFormat:@"yyyy-MM-dd HH"];
    }
    
    NSComparisonResult result = [bTM compare:eTM];
    if (result==NSOrderedSame)
    {
        num = 0;
    }else if (result==NSOrderedAscending)
    {
        num = 1;
        
    }else if (result==NSOrderedDescending)
    {
        num = 2;
        
    }
    NSLog(@"num:%ld",num);
    return num;
}

@end
