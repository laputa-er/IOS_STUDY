//
//  JKContactModel.m
//  L12通讯录
//
//  Created by TonyEarth on 16/3/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "JKContactModel.h"

@implementation JKContactModel
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.phone forKey:@"phone"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.name = [decoder decodeObjectForKey:@"name"];
        self.phone= [decoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end
