//
//  main.m
//  countOfCodeLine
//
//  Created by lulaos on 15/8/26.
//  Copyright (c) 2015年 lulaos. All rights reserved.
//

#import <Foundation/Foundation.h>


NSInteger countOfCodeLine(NSString *path)
{
    NSInteger count = 0;
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 是否为文件夹
    BOOL dir = NO;
    [mgr fileExistsAtPath:path isDirectory:&dir];
    
    // 是文件夹
    if (dir) {
        NSArray *array = [mgr contentsOfDirectoryAtPath:path error:nil];
        for (NSString *filePath in array){
            NSString *realPath = [NSString stringWithFormat:@"%@/%@",path,filePath];
            count += countOfCodeLine(realPath);
        }
    }
    
    // 不是文件夹
    else {
        NSInteger i = 0;
        NSMutableString *str = [NSMutableString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSArray *array = [str componentsSeparatedByString:@"\n"];
        for (NSString *str in array){
            if ([str compare:@""] != 0) {
                i++;
            }
        }
        count = i;
    }
    
    
    return  count;
}

int main() {
    //项目代码的路径
    NSString *path = @"/Users/biao/Desktop/Code";
    NSLog(@"该项目的代码总行数%ld",countOfCodeLine(path));
    return 0;
}
