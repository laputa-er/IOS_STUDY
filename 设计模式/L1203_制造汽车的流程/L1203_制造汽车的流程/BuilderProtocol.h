//
//  BuilderProtocol.h
//  L1203_制造汽车的流程
//
//  Created by TonyEarth on 16/5/29.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BuilderProtocol <NSObject>
@required
/**
 *  构建对象
 *
 *  @return 返回构件的对象
 */
- (id)build;
@end
