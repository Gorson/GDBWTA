//
//  ViewController1.m
//  Animations
//
//  Created by Dmitry Klimkin on 20/11/12.
//  Copyright (c) 2012 Dmitry Klimkin. All rights reserved.
//

#import "BTCocktailViewController.h"
#import "SlidingGridView.h"
#import "BTCocktailDetailViewController.h"

#define NSINTEGER 7
#define NUMBER_OF_PAGE 2


@interface BTCocktailViewController () <SlidingGridViewDelegate>
{
    UIButton *backButton;
    UIToolbar *tabBar;
    UIBarButtonItem *_type;
    UIBarButtonItem *_train;
    UIBarButtonItem *_referrals;
    NSArray *items;
    UIBarButtonItem *flexibleItem;
    UIButton *_bt;
    UIScrollView *_scrollView;
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
        _slideController = [[SlidingGridView alloc] initWithFrame:CGRectMake(10, 50, 300, 430-44)];
        _slideController.backgroundColor = [UIColor clearColor];
        _slideController.delegate = self;
        _slideController.cellBackgroundColor = [UIColor clearColor];
//        [self.view addSubview: _slideController];
    }
    return _slideController;
}

- (void)viewDidLoad
{
//    self.navigationItem.title = @"Sliding Grid View";
    [super viewDidLoad];
    [self initWithControl];
    [self initWithUI];
//    [self initWithControl];
}

-(void)initWithUI
{
    static const NSInteger NumberOfPage = NUMBER_OF_PAGE;
    static const NSInteger ViewHeight = 320;
    _scrollView =[[[UIScrollView alloc]init]autorelease];
    _scrollView.frame = CGRectMake(0, 40, 320, 480-44-40);
    NSInteger i;
    for (i=1; i<NSINTEGER; i++) {
        _bt = [UIButton buttonWithType:UIButtonTypeCustom];
        _bt.tag = i;
        _bt.backgroundColor = [UIColor yellowColor];
        [_bt addTarget:self action:@selector(bt:) forControlEvents:UIControlEventTouchUpInside];
        
        switch (_bt.tag) {
            case 1:
                _bt.frame = CGRectMake(23.75, 60, 75, 122);
                break;
            case 2:
                _bt.frame = CGRectMake(23.75*2+75, 60, 75, 122);
                break;
            case 3:
                _bt.frame = CGRectMake(320-23.75-75, 60, 75, 122);
                break;
            case 4:
                _bt.frame = CGRectMake(23.75, 60+20+122, 75.f, 122.f);
                break;
            case 5:
                _bt.frame = CGRectMake(23.75*2+75, 60+20+122, 75.f, 122.f);
                break;
            case 6:
                _bt.frame = CGRectMake(320-23.75-75, 60+20+122, 75.f, 122.f);
                break;

                
            default:
                break;
        }
        [_scrollView addSubview:_bt];

    }
    _scrollView.contentSize = CGSizeMake(320*NUMBER_OF_PAGE, ViewHeight);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 30, 30);
    backButton.backgroundColor = [UIColor blueColor];
    [backButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
//    tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0.0, 480.0-69.0, 320.0, 49.0)];
//    tabBar.delegate = self;
//    [tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar1.png"]];
//    [self.view addSubview:tabBar];
    
    tabBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 460-40, 320, 44)];
    tabBar.barStyle = UIBarStyleDefault;
    [self.view addSubview:tabBar];
    [tabBar release];

//    _type = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon"] style:UIBarButtonItemStylePlain target:self action:@selector(_type:)];
        _type = [[UIBarButtonItem alloc]initWithTitle:@"品种" style:UIBarButtonItemStylePlain target:self action:@selector(_type:) ];
    _train = [[UIBarButtonItem alloc]initWithTitle:@"培训" style:UIBarButtonItemStylePlain target:self action:@selector(_train:) ];
    _referrals = [[UIBarButtonItem alloc]initWithTitle:@"推介" style:UIBarButtonItemStylePlain target:self action:@selector(_referrals:) ];
    flexibleItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    items = @[_type,flexibleItem,_train,flexibleItem,_referrals];
//    [self setToolbarItems:items animated:YES];
    [tabBar setItems:items animated:YES];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    
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

- (void)initWithControl
{
    UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT)];
    [backgoundView setImage:[UIImage imageNamed:@"mainBackgound.png"]];
    [self.view addSubview:backgoundView];
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.navigationController setToolbarHidden:NO animated:YES];
//}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(setLoadedImages) withObject:nil afterDelay:2.0f];
}

- (void) setLoadedImages
{
    self.slideController.cellSubViews = self.images;
}

/*
 获取图片的id
 */
- (void)didSelectViewIn:(SlidingGridView *)controller selectedViewIndex:(int)viewIndex
{
    NSLog (@"Selected image idx: %d", viewIndex);
}

- (void)backView:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)_bt:(UIButton *)sender
{
    BTCocktailDetailViewController *btCocktailDetailViewController = [[BTCocktailDetailViewController alloc]init];
    [self.navigationController pushViewController:btCocktailDetailViewController animated:YES];

}

@end
