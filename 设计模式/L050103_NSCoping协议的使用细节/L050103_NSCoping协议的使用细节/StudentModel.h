//
//  StudentModel.h
//  L050103_NSCoping协议的使用细节
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "BaseCopyObject.h"

@interface StudentModel : BaseCopyObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

@end
