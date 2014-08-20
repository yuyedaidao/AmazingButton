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
@property (strong,nonatomic) AmazingButton *button;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.button = [[AmazingButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    [self.button showAnimation];
}
@end
