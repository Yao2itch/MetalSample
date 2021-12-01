//
//  ViewController.m
//  MetalTut
//
//  Created by 姚隽楠 on 2021/10/27.
//  Copyright © 2021 tencent. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
{
    MTKView *_view;
    MetalRenderer *_renderer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _view = (MTKView *)self.view;
    
    _view.enableSetNeedsDisplay = YES;
    
    _view.device = MTLCreateSystemDefaultDevice();
    
    _view.clearColor = MTLClearColorMake(0.0, 0.5, 1.0, 1.0);
    
    _renderer = [[MetalRenderer alloc] initWithMetalKitView:_view];
    
    if(!_renderer)
    {
        return;
    }
    // Initialize the renderer with the view size
    [_renderer mtkView:_view drawableSizeWillChange:_view.drawableSize];
    
    _view.delegate = _renderer;
}


@end
