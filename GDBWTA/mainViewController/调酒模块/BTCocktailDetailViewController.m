//
//  BTCocktailDetailViewController.m
//  GDBWTA
//
//  Created by Air on 13-7-21.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import "BTCocktailDetailViewController.h"

@interface BTCocktailDetailViewController ()

@end

@implementation BTCocktailDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initWithControl];
	// Do any additional setup after loading the view.
}

- (void)initWithControl
{
    UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT)];
    [backgoundView setImage:[UIImage imageNamed:@"mainBackgound.png"]];
    [self.view addSubview:backgoundView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
