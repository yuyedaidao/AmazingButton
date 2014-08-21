//
//  ViewController.m
//  AmazingButton
//
//  Created by Wang on 14-8-20.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

#import "ViewController.h"
#import "AmazingButton.h"

@interface ViewController ()
- (IBAction)click:(id)sender;
@property (strong,nonatomic) NSArray *buttons;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    AmazingButton *button1 = [[AmazingButton alloc] initWithFrame:CGRectMake(85, 100, 50, 50) color:[UIColor orangeColor] type:AmaButtonTypeUser];
    [self.view addSubview:button1];
    AmazingButton *button2 = [[AmazingButton alloc] initWithFrame:CGRectMake(195, 100, 50, 50) color:[UIColor greenColor] type:AmaButtonTypeMessage];
    [self.view addSubview:button2];
    AmazingButton *button3 = [[AmazingButton alloc] initWithFrame:CGRectMake(85, 200, 50, 50) color:[UIColor blueColor] type:AmaButtonTypeLocation];
    [self.view addSubview:button3];
    AmazingButton *button4 = [[AmazingButton alloc] initWithFrame:CGRectMake(195, 200, 50, 50) color:[UIColor purpleColor] type:AmaButtonTypeFodder];
    [self.view addSubview:button4];
    AmazingButton *button5 = [[AmazingButton alloc] initWithFrame:CGRectMake(135, 300, 50, 50) color:[UIColor yellowColor] type:AmaButtonTypeNews];
    [self.view addSubview:button5];
    
    self.buttons = [NSArray arrayWithObjects:button1,button2,button3,button4,button5,nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(UIButton *)sender {
    [sender setTitle:@"again" forState:UIControlStateNormal];
    [self.buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       AmazingButton *button = obj;
       [button show];
    }];
}
@end
