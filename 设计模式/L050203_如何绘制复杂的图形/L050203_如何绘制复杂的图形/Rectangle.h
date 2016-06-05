//
//  Rectangle.h
//  L050203_如何绘制复杂的图形
//
//  Created by TonyEarth on 16/5/2.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Rectangle : NSObject

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

- (void)draw;

@end
