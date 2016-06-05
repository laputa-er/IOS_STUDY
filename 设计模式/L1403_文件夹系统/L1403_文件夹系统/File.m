//
//  File.m
//  L1403_文件夹系统
//
//  Created by TonyEarth on 16/5/30.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "File.h"

@interface File ()

@property (nonatomic, strong) NSMutableArray <File *> *childFiles;

@end

@implementation File

- (instancetype)init {
    if (self = [super init]) {
        self.childFiles = [NSMutableArray array];
    }
    return self;
}

- (void)addFile:(File *)file {
    NSParameterAssert(file);
    [self.childFiles addObject:file];
}

+ (instancetype)fileWithFileType:(EFile)fileType fileName:(NSString *)name {
    File *file = [[[self class] alloc] init];
    file.fileType = fileType;
    file.name = name;
    return file;
}
@end
