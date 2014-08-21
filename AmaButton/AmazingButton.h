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
//    AmaButtonTypeOrder,
//    AmaButtonTypeImage,
//    AmaButtonTypeVideo,
//    AmaButtonTypePost,
//    AmaButtonTypeAudio,
    AmaButtonTypeUser,
    AmaButtonTypeLocation,
    AmaButtonTypeMessage,
    AmaButtonTypeSetting,
    AmaButtonTypeFodder
} AmaButtonType;

@interface AmazingButton : UIControl
-(instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color type:(AmaButtonType)type;
-(void)show;
@end
