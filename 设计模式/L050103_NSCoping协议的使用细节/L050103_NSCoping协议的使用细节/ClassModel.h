//
//  ClassModel.h
//  L050103_NSCoping协议的使用细节
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "BaseCopyObject.h"

@interface ClassModel : BaseCopyObject

@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSArray *students;

@end
