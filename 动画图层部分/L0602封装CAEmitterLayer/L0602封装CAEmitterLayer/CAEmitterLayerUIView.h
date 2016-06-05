//
//  CAEmitterLayerUIView.h
//  L0602封装CAEmitterLayer
//
//  Created by TonyEarth on 16/4/10.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAEmitterLayerUIView : UIView
// set
- (void)setEmitterLayer:(CAEmitterLayer *)layer;

// get
- (CAEmitterLayer *)emitterLayer;

// 显示view
- (void)show;

// 隐藏view
- (void)hide;
@end
