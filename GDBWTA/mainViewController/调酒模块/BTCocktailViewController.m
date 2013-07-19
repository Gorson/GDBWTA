//
//  ViewController1.m
//  Animations
//
//  Created by Dmitry Klimkin on 20/11/12.
//  Copyright (c) 2012 Dmitry Klimkin. All rights reserved.
//

#import "BTCocktailViewController.h"
#import "SlidingGridView.h"

@interface BTCocktailViewController () <SlidingGridViewDelegate>
{
    UIButton *backButton;
}
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) SlidingGridView *slideController;

@end

@implementation BTCocktailViewController

@synthesize images = _images;
@synthesize slideController = _slideController;

- (SlidingGridView*)slideController
{
    if (_slideController == nil)
    {
        _slideController = [[SlidingGridView alloc] initWithFrame:CGRectMake(10, 0, 300, IPHONE_HEIGHT)];
        _slideController.backgroundColor = [UIColor clearColor];
        _slideController.delegate = self;
        _slideController.cellBackgroundColor = [UIColor darkGrayColor];

//        [self.view addSubview: _slideController];
    }
    return _slideController;
}

- (void)viewDidLoad
{
    self.navigationItem.title = @"Sliding Grid View";
    [super viewDidLoad];
    UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT - 20.0f)];
    [backgoundView setImage:[UIImage imageNamed:@"secondViewController.png"]];
    [self.view addSubview:backgoundView];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(15, 10, 40, 20);
//    backButton.backgroundColor = [UIColor redColor];
    [backButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(20, 80, 80, 100);
//    backButton.backgroundColor = [UIColor redColor];
    [backButton addTarget:self action:@selector(gotoDetailView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];

//    secondViewControllerDetail.png
	// Do any additional setup after loading the view, typically from a nib
    
    //self.view.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    
    NSMutableArray *imgs = [[NSMutableArray alloc] init];
    
    for (int i=1; i<41; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"%d", i];
        UIImage *img = [UIImage imageNamed:imageName];
        UIImageView *imgView = [[UIImageView alloc] initWithImage: img];
        [imgs addObject: imgView];
    }
    
    self.images = imgs;
    
    self.slideController.allowRefreshWithShake = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(setLoadedImages) withObject:nil afterDelay:2.0f];
}

- (void) setLoadedImages
{
    self.slideController.cellSubViews = self.images;
}

- (void)didSelectViewIn:(SlidingGridView *)controller selectedViewIndex:(int)viewIndex
{
    NSLog (@"Selected image idx: %d", viewIndex);
}

- (void)backView:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gotoDetailView
{
    UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT - 20.0f)];
    [backgoundView setImage:[UIImage imageNamed:@"secondViewControllerDetail.png"]];
    UIButton *backButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton2.frame = CGRectMake(15, 10, 40, 20);
//    backButton2.backgroundColor = REDColor;
    [backButton2 addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIViewController * detailViewController = [[UIViewController alloc]init];
    [detailViewController.view addSubview:backgoundView];
    [detailViewController.view addSubview:backButton2];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
