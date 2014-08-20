//
//  AmazingButton.h
//  AmazingButton
//
//  Created by Wang on 14-8-20.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    AmaButtonTypeNews,
    AmaButtonTypeOrder,
    AmaButtonTypeImage,
    AmaButtonTypeVideo,
    AmaButtonTypePost,
    AmaButtonTypeAudio,
    AmaButtonTypeUser,
    AmaButtonTypeLocation,
    AmaButtonTypeMessage,
    AmaButtonTypeSetting,
} AmaButtonType;

@interface AmazingButton : UIControl
@property (nonatomic,strong) UIColor *color;
-(void)showAnimation;
@end
