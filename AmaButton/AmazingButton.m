//
//  AmazingButton.m
//  AmazingButton
//
//  Created by Wang on 14-8-20.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

#import "AmazingButton.h"
#define LOGCMD NSLog(@"%@:%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd))
#define SQRT2 1.4142135623730950488016887242097f
#import <POP.h>
@interface AmazingButton()
@property (strong,nonatomic) CAShapeLayer *circleLayer;
@property (strong,nonatomic) CAShapeLayer *firstLayer;
@property (strong,nonatomic) CAShapeLayer *secondLayer;
@property (strong,nonatomic) CAShapeLayer *thirdLayer;
@property (strong,nonatomic) CAShapeLayer *fourthLayer;
@property (strong,nonatomic) CAShapeLayer *fifthLayer;
@property (assign,nonatomic) AmaButtonType type;
@property (assign,nonatomic) CGSize size;
@property (nonatomic,strong) UIColor *color;
@end
@implementation AmazingButton
-(instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color type:(AmaButtonType)type{
    if([self initWithFrame:frame]){
        self.color = color;
        self.type = type;
        [self prepareLayers];
    }
    return self;
}
-(void)prepareLayers{
    
    CGSize size = self.size = self.bounds.size;
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.frame = self.bounds;
    [self.layer addSublayer:self.circleLayer];
    
    
    switch (self.type) {
        case AmaButtonTypeNews:
        {
            self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:size.width/2 startAngle:-M_PI endAngle:M_PI clockwise:YES].CGPath;
            self.circleLayer.fillColor = [UIColor clearColor].CGColor;
            self.circleLayer.strokeColor = self.color.CGColor;
            self.circleLayer.lineWidth = 1.0f;
            self.circleLayer.hidden = YES;
            
            CGMutablePathRef linePath1 = CGPathCreateMutable();
            CGPathMoveToPoint(linePath1, NULL, size.width*0.3, size.height*0.3);
            CGPathAddLineToPoint(linePath1, NULL, size.width*0.7, size.height*0.3);
            
            self.firstLayer = [CAShapeLayer layer];
            self.firstLayer.frame = self.bounds;
            self.firstLayer.lineCap = kCALineCapRound;
            self.firstLayer.strokeColor = self.color.CGColor;
            self.firstLayer.lineWidth = 2.0f;
            self.firstLayer.path = linePath1;
            CGPathRelease(linePath1);
            [self.layer addSublayer:self.firstLayer];
            
            CGMutablePathRef linePath2 = CGPathCreateMutable();
            CGPathMoveToPoint(linePath2, NULL, size.width*0.3, size.height/2);
            CGPathAddLineToPoint(linePath2, NULL, size.width*0.7, size.height/2);
            
            self.secondLayer = [CAShapeLayer layer];
            self.secondLayer.frame = self.bounds;
            self.secondLayer.lineCap = kCALineCapRound;
            self.secondLayer.strokeColor = self.color.CGColor;
            self.secondLayer.lineWidth = 2.0f;
            self.secondLayer.path = linePath2;
            CGPathRelease(linePath2);
            [self.layer addSublayer:self.secondLayer];
            
            CGMutablePathRef linePath3 = CGPathCreateMutable();
            CGPathMoveToPoint(linePath3, NULL, size.width*0.3, size.height*0.7);
            CGPathAddLineToPoint(linePath3, NULL, size.width*0.6, size.height*0.7);
            
            self.thirdLayer = [CAShapeLayer layer];
            self.thirdLayer.frame = self.bounds;
            self.thirdLayer.lineCap = kCALineCapRound;
            self.thirdLayer.strokeColor = self.color.CGColor;
            self.thirdLayer.lineWidth = 2.0f;
            self.thirdLayer.path = linePath3;
            CGPathRelease(linePath3);
            [self.layer addSublayer:self.thirdLayer];
            
            self.firstLayer.hidden = YES;
            self.thirdLayer.hidden = YES;
            self.secondLayer.hidden = YES;
        }
            break;
        case AmaButtonTypeUser:
        {
            self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:size.width/2 startAngle:-M_PI endAngle:M_PI clockwise:YES].CGPath;
            self.circleLayer.fillColor = [UIColor clearColor].CGColor;
            self.circleLayer.strokeColor = self.color.CGColor;
            self.circleLayer.lineWidth = 1.0f;
            self.circleLayer.hidden = YES;
            
            
            CGMutablePathRef linePath1 = CGPathCreateMutable();
            //                CGPathMoveToPoint(linePath1, NULL, size.width*0.5, size.height*0.4);
            CGPathAddArc(linePath1, NULL, size.width*0.5, size.height*0.25, size.width*0.15, -M_PI, M_PI, NO);
            CGPathMoveToPoint(linePath1, NULL, size.width*0.5, size.height*0.4);
            CGPathAddArc(linePath1, NULL, size.width*0.5, size.height*0.7, size.width*0.3, -M_PI_2,M_PI_2*0.1, NO);
            CGPathMoveToPoint(linePath1, NULL, size.width*0.5, size.height*0.4);
            CGPathAddArc(linePath1, NULL, size.width*0.5, size.height*0.7, size.width*0.3, -M_PI_2,M_PI*0.95, YES);
            self.firstLayer = [CAShapeLayer layer];
            self.firstLayer.frame = self.bounds;
            self.firstLayer.lineCap = kCALineCapRound;
            self.firstLayer.fillColor = [UIColor clearColor].CGColor;
            self.firstLayer.strokeColor = self.color.CGColor;
            self.firstLayer.lineWidth = 2.0f;
            self.firstLayer.path = linePath1;
            CGPathRelease(linePath1);
            [self.layer addSublayer:self.firstLayer];
            self.firstLayer.hidden = YES;
        }
            break;
        case AmaButtonTypeLocation:
        {
            
            self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:size.width/2 startAngle:-M_PI endAngle:M_PI clockwise:YES].CGPath;
            self.circleLayer.fillColor = [UIColor clearColor].CGColor;
            self.circleLayer.strokeColor = self.color.CGColor;
            self.circleLayer.lineWidth = 1.0f;
            self.circleLayer.hidden = YES;
            
            CGFloat r = size.width/2;
            CGMutablePathRef linePath1 = CGPathCreateMutable();
            //                CGPathMoveToPoint(linePath1, NULL, size.width*0.5, size.height*0.4);
            CGPathAddArc(linePath1, NULL, size.width*0.5, size.height*0.5, size.width*0.5, M_PI_2*1.5, M_PI_2*0.5, YES);
            CGPathAddLineToPoint(linePath1, NULL, size.width*0.5, size.height*1.2);
            CGPathAddLineToPoint(linePath1, NULL, r-r*SQRT2/2, r+r*SQRT2/2);
            
            self.firstLayer = [CAShapeLayer layer];
            self.firstLayer.frame = self.bounds;
            self.firstLayer.lineCap = kCALineCapRound;
            self.firstLayer.fillColor = self.color.CGColor;
            self.firstLayer.strokeColor = self.color.CGColor;
            self.firstLayer.lineWidth = 1.0f;
            self.firstLayer.path = linePath1;
            CGPathRelease(linePath1);
            [self.circleLayer addSublayer:self.firstLayer];
            
            
            self.secondLayer = [CAShapeLayer layer];
            self.secondLayer.frame = self.bounds;
            self.secondLayer.fillColor = self.color.CGColor;
            self.secondLayer.path = [UIBezierPath bezierPathWithArcCenter:self.firstLayer.position radius:size.width*0.2 startAngle:M_PI endAngle:-M_PI clockwise:YES].CGPath;
            [self.layer addSublayer:self.secondLayer];
            self.secondLayer.hidden = YES;
            
        }
            break;
        case AmaButtonTypeMessage:
        {
            self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:size.width/2 startAngle:-M_PI endAngle:M_PI clockwise:YES].CGPath;
            self.circleLayer.fillColor = [UIColor clearColor].CGColor;
            self.circleLayer.strokeColor = self.color.CGColor;
            self.circleLayer.lineWidth = 1.0f;
            self.circleLayer.hidden = YES;
            
            
            CGMutablePathRef linePath1 = CGPathCreateMutable();
            //                CGPathMoveToPoint(linePath1, NULL, size.width*0.5, size.height*0.4)
            CGPathMoveToPoint(linePath1, NULL, size.width*0.45, size.height*0.5);
            CGPathAddLineToPoint(linePath1, NULL, size.width*0.07, size.height*0.75);
            
            CGPathMoveToPoint(linePath1, NULL, size.width*0.55, size.height*0.5);
            CGPathAddLineToPoint(linePath1, NULL, size.width*0.93, size.height*0.75);
            
            self.firstLayer = [CAShapeLayer layer];
            self.firstLayer.frame = self.bounds;
            self.firstLayer.lineCap = kCALineCapRound;
            self.firstLayer.fillColor = [UIColor clearColor].CGColor;
            self.firstLayer.strokeColor = self.color.CGColor;
            self.firstLayer.lineWidth = 1.0f;
            self.firstLayer.path = linePath1;
            CGPathRelease(linePath1);
            [self.layer addSublayer:self.firstLayer];
            self.firstLayer.hidden = YES;
            
            CGMutablePathRef linePath2 = CGPathCreateMutable();
            //                CGPathMoveToPoint(linePath1, NULL, size.width*0.5, size.height*0.4)
            CGPathMoveToPoint(linePath2, NULL, size.width*0.5, size.height*0.5);
            CGPathAddLineToPoint(linePath2, NULL, size.width*0.2, size.height*0.4);
            CGPathAddLineToPoint(linePath2, NULL, size.width*0.5, size.height*0.6);
            CGPathAddLineToPoint(linePath2, NULL, size.width*0.8, size.height*0.4);
            CGPathAddLineToPoint(linePath2, NULL, size.width*0.5, size.height*0.5);
            
            self.secondLayer = [CAShapeLayer layer];
            self.secondLayer.frame = self.bounds;
            self.secondLayer.lineCap = kCALineCapSquare;
            self.secondLayer.fillColor = self.color.CGColor;
            self.secondLayer.strokeColor = self.color.CGColor;
            self.secondLayer.lineWidth = 1.0f;
            self.secondLayer.path = linePath2;
            CGPathRelease(linePath2);
            [self.layer addSublayer:self.secondLayer];
            self.secondLayer.hidden = YES;
        }
            break;
        case AmaButtonTypeFodder:
        {
            self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:size.width/2 startAngle:-M_PI endAngle:M_PI clockwise:YES].CGPath;
            self.circleLayer.fillColor = [UIColor clearColor].CGColor;
            self.circleLayer.strokeColor = self.color.CGColor;
            self.circleLayer.lineWidth = 1.0f;
            self.circleLayer.hidden = YES;
            
            
            CGMutablePathRef linePath1 = CGPathCreateMutable();
            //                CGPathMoveToPoint(linePath1, NULL, size.width*0.5, size.height*0.4)
            CGPathMoveToPoint(linePath1, NULL, size.width*0.3, size.height*0.4);
            CGPathAddLineToPoint(linePath1, NULL, size.width*0.7, size.height*0.4);
            
            CGPathMoveToPoint(linePath1, NULL, size.width*0.4, size.height*0.3);
            CGPathAddLineToPoint(linePath1, NULL, size.width*0.6, size.height*0.3);
            
            self.firstLayer = [CAShapeLayer layer];
            self.firstLayer.frame = self.bounds;
            self.firstLayer.lineCap = kCALineCapRound;
            self.firstLayer.fillColor = [UIColor clearColor].CGColor;
            self.firstLayer.strokeColor = self.color.CGColor;
            self.firstLayer.lineWidth = 1.0f;
            self.firstLayer.path = linePath1;
            CGPathRelease(linePath1);
            [self.layer addSublayer:self.firstLayer];
            self.firstLayer.hidden = YES;
            
            CGMutablePathRef linePath2 = CGPathCreateMutable();
            
            CGPathMoveToPoint(linePath2, NULL, size.width*0.1, size.height*0.5);
            CGPathAddLineToPoint(linePath2, NULL, size.width*0.25, size.height*0.5);
            CGPathAddArc(linePath2, NULL, size.width*0.5, size.height*0.5, size.width*0.25, M_PI, 0, YES);
            
            CGPathMoveToPoint(linePath2, NULL, size.width*0.75, size.height*0.5);
            CGPathAddLineToPoint(linePath2, NULL, size.width*0.9, size.height*0.5);
            
            self.secondLayer = [CAShapeLayer layer];
            self.secondLayer.frame = self.bounds;
            self.secondLayer.lineCap = kCALineCapSquare;
            self.secondLayer.fillColor = [UIColor clearColor].CGColor;
            self.secondLayer.strokeColor = self.color.CGColor;
            self.secondLayer.lineWidth = 1.0f;
            self.secondLayer.path = linePath2;
            CGPathRelease(linePath2);
            [self.layer addSublayer:self.secondLayer];
            self.secondLayer.hidden = YES;
        }
            break;
            
        default:
            break;
    }
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)touchDown{
    //circle变大
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        [self circleAnimate:YES];
    }
}
-(void)show{

    switch (self.type) {
            case AmaButtonTypeNews:
            {
                self.secondLayer.hidden = NO;
                POPSpringAnimation *line1 = [self.firstLayer pop_animationForKey:@"line1Animation"];
                if(line1==nil){
                    line1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleX];
                    line1.fromValue = @(0.0);
                    line1.toValue = @(1.0);
                    [self.firstLayer pop_addAnimation:line1 forKey:@"line1Animation"];
                }else{
                    line1.fromValue = @(0.0);
                    line1.toValue = @(1.0);
                }
                self.firstLayer.hidden = NO;
                POPSpringAnimation *line3 = [self.firstLayer pop_animationForKey:@"line3Animation"];
                if(line3==nil){
                    line3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleX];
                    line3.fromValue = @(0.0);
                    line3.toValue = @(1.0);
                    [self.thirdLayer pop_addAnimation:line1 forKey:@"line3Animation"];
                }else{
                    line3.fromValue = @(0.0);
                    line3.toValue = @(1.0);
                }
                self.thirdLayer.hidden = NO;
            }
                break;
                
            case AmaButtonTypeUser:
            {
                
                POPBasicAnimation *userAnimation = [self.firstLayer pop_animationForKey:@"userAnimation"];
                if(userAnimation==nil){
                    userAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
                    userAnimation.fromValue = @(self.size.height*0.8);
                    userAnimation.toValue = @(self.size.height*0.5);
                    [self.firstLayer pop_addAnimation:userAnimation forKey:@"userAnimation"];
                }else{
                    userAnimation.fromValue = @(self.size.height*0.8);
                    userAnimation.toValue = @(self.size.height*0.5);
                }
                self.firstLayer.hidden = NO;
            }
                break;
            case AmaButtonTypeLocation:
            {
                
                POPSpringAnimation *locationAnimation = [self.secondLayer pop_animationForKey:@"locationAnimation"];
                if(locationAnimation==nil){
                    locationAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
                    locationAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(1.5, 1.5)];
                    locationAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
                    locationAnimation.springSpeed = 20.0f;
                    locationAnimation.springBounciness = 20.0f;
                    [self.secondLayer pop_addAnimation:locationAnimation forKey:@"locationAnimation"];
                }else{
                    locationAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(1.5, 1.5)];
                    locationAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
                }
                self.secondLayer.hidden = NO;
            }
                break;
            case AmaButtonTypeMessage:
            {
                
                POPSpringAnimation *bottomAnimation = [self.firstLayer pop_animationForKey:@"bottomAnimation"];
                if(bottomAnimation==nil){
                    bottomAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
                    bottomAnimation.fromValue = @(self.size.height);
                    bottomAnimation.toValue = @(self.size.height/2);
                    [self.firstLayer pop_addAnimation:bottomAnimation forKey:@"bottomAnimation"];
                }else{
                    bottomAnimation.fromValue = @(self.size.height);
                    bottomAnimation.toValue = @(self.size.height/2);
                }
                self.secondLayer.hidden = NO;
                
                POPSpringAnimation *topAnimation = [self.firstLayer pop_animationForKey:@"topAnimation"];
                if(topAnimation==nil){
                    topAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
                    topAnimation.fromValue = @(0.0);
                    topAnimation.toValue = @(self.size.height/2);
                    [self.secondLayer pop_addAnimation:topAnimation forKey:@"topAnimation"];
                }else{
                    topAnimation.fromValue = @(0.0);
                    topAnimation.toValue = @(self.size.height/2);
                }
                self.firstLayer.hidden = NO;
            }
                break;
            case AmaButtonTypeFodder:
            {
                
                POPSpringAnimation *bottomAnimation = [self.firstLayer pop_animationForKey:@"bottomAnimation"];
                if(bottomAnimation==nil){
                    bottomAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
                    bottomAnimation.fromValue = @(self.size.height*0.9);
                    bottomAnimation.toValue = @(self.size.height/2);
                    [self.secondLayer pop_addAnimation:bottomAnimation forKey:@"bottomAnimation"];
                }else{
                    bottomAnimation.fromValue = @(self.size.height*0.9);
                    bottomAnimation.toValue = @(self.size.height/2);
                }
                self.secondLayer.hidden = NO;
                
                POPSpringAnimation *topAnimation = [self.firstLayer pop_animationForKey:@"topAnimation"];
                if(topAnimation==nil){
                    topAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
                    topAnimation.fromValue = @(self.size.height*1.5);
                    topAnimation.toValue = @(self.size.height/2);
                    [self.firstLayer pop_addAnimation:topAnimation forKey:@"topAnimation"];
                }else{
                    topAnimation.fromValue = @(self.size.height*1.5);
                    topAnimation.toValue = @(self.size.height/2);
                }
                self.firstLayer.hidden = NO;
            }
                break;
            default:
                break;
        }
    
    [self circleAnimate:self.isSelected];
    
}
-(void)circleAnimate:(BOOL)isBig{
    NSValue *toValue = nil;
    if(isBig){
        toValue = [NSValue valueWithCGSize:CGSizeMake(1.3, 1.3)];
    }else{
        toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    }
    POPSpringAnimation *scale = [self.circleLayer pop_animationForKey:@"scaleCirle"];
    if(scale==nil){
        scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scale.fromValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
        scale.toValue = toValue;
        scale.springSpeed = 20.0f;
        scale.springBounciness = 20.0f;
        [self.circleLayer pop_addAnimation:scale forKey:@"scaleCirle"];
    }else{
        scale.fromValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
        scale.toValue = toValue;
    }
    self.circleLayer.hidden = NO;
}
-(void)circleRest{
    [self.circleLayer pop_removeAllAnimations];
    POPSpringAnimation *scale = [self.circleLayer pop_animationForKey:@"resetCirle"];
    if(scale==nil){
        scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scale.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
        scale.springSpeed = 30.0f;
        scale.springBounciness = 20.0f;
        [self.circleLayer pop_addAnimation:scale forKey:@"resetCirle"];
    }else{
        scale.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self circleAnimate:YES];
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    [self circleRest];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    [self circleRest];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
