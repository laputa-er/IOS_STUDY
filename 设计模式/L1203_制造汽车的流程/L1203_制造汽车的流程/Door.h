//
//  Door.h
//  L1203_制造汽车的流程
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractDoor.h"
#import "BuilderProtocol.h"

@interface Door : NSObject <AbstractDoor, BuilderProtocol>

@end
