#import "CAEmitterLayerView.h"

@interface CAEmitterLayerView () {

    CAEmitterLayer  *_emitterLayer;
    
}

@end

@implementation CAEmitterLayerView

+ (Class)layerClass {
    return [CAEmitterLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _emitterLayer = (CAEmitterLayer *)self.layer;
        
    }
    return self;
}

- (void)show {

}

- (void)hide {
    
}

- (void)setEmitterLayer:(CAEmitterLayer *)layer {
    _emitterLayer = layer;
}

- (CAEmitterLayer *)emitterLayer {
    return _emitterLayer;
}

@end
