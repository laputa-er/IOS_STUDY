//
//  CAEmitterLayerUIView.m
//  L0602封装CAEmitterLayer
//
//  Created by TonyEarth on 16/4/10.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

#import "CAEmitterLayerUIView.h"

@interface CAEmitterLayerUIView () {
    CAEmitterLayer *_emitterLayer;// 粒子图层
}
@end

@implementation CAEmitterLayerUIView

// 构造函数
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _emitterLayer = (CAEmitterLayer *)self.layer;
    }
    return self;
}

// 获取类本身
+ (Class)layerClass
{
    return [CAEmitterLayer class];
}

// set
- (void)setEmitterLayer:(CAEmitterLayer *)layer
{
    _emitterLayer = layer;
}

// get
- (CAEmitterLayer *)emitterLayer
{
    return _emitterLayer;
}

- (void)show {}
- (void)hide {}
@end
