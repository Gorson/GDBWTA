//
//  BTAboutusViewController.m
//  GDBWTA
//
//  Created by HJJ on 13-7-15.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import "BTAboutusViewController.h"

@interface BTAboutusViewController ()

@end

@implementation BTAboutusViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initWithControl
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(15, 10, 40, 20);
    backButton.backgroundColor = REDColor;
    [backButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initWithControl];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backView:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
