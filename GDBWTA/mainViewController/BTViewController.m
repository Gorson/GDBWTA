//
//  BTViewController.m
//  Created by http://github.com/iosdeveloper
//

#import "BTViewController.h"
#import "BTCocktailViewController.h"
#import "BTSettingViewController.h"
#import "RadioButtonViewController.h"

#import "SegmentedButton.h"

#import "BTMainModel.h"
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define NUMBER_OF_ITEMS (IS_IPAD? 19: 12)
#define NUMBER_OF_VISIBLE_ITEMS 25
#define ITEM_SPACING 180.0f
#define INCLUDE_PLACEHOLDERS YES

@interface BTViewController()
@property (nonatomic ,retain)BTSettingViewController *settingViewController;

@end

@implementation BTViewController
@synthesize carousel;
// DATA
@synthesize items;
@synthesize wrap;
@synthesize settingViewController;

@synthesize segmentedButtonView;
@synthesize imageSegmentedButton;
#pragma mark
#pragma mark - init method

- (id)init
{
	if ((self = [super init]))
    {
        
	}
	return self;
}

- (void)initWithData
{
    //set up data
	wrap = YES;
	self.items = [NSMutableArray array];
//	for (int i = 0; i < NUMBER_OF_ITEMS; i++)
//	{
//		[items addObject:[NSNumber numberWithInt:i]];
//	}
    BTMainModel *mainModel = [[BTMainModel alloc]init];
    mainModel.imagePath = @"mainView.png";
    mainModel.infomation = @"协会最新资讯";
    [items addObject:mainModel];
    [mainModel release];
    mainModel = [[BTMainModel alloc]init];
    mainModel.imagePath = @"11.png";
    mainModel.infomation = @"马天尼最新动态";
    [items addObject:mainModel];
    [mainModel release];
    mainModel = [[BTMainModel alloc]init];
    mainModel.imagePath = @"icon.png";
    mainModel.infomation = @"Sunny Coffee最新动态";
    [items addObject:mainModel];
    [mainModel release];
    mainModel = [[BTMainModel alloc]init];
    mainModel.imagePath = @"18.png";
    mainModel.infomation = @"线上学堂";
    [items addObject:mainModel];
    [mainModel release];
    mainModel = [[BTMainModel alloc]init];
    mainModel.imagePath = @"23.png";
    mainModel.infomation = @"敬请期待";
    [items addObject:mainModel];
    [mainModel release];
}

- (void)initWithControl
{    
    UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT)];
    [backgoundView setImage:[UIImage imageNamed:@"background.png"]];
    [self.view addSubview:backgoundView];
    //    backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, IPHONE_HEIGHT - 64.0f, IPHONE_WIDTH,49.0f)];
//    [backgoundView setImage:[UIImage imageNamed:@"tabbar1.png"]];
//    [self.view addSubview:backgoundView];
    
    imageSegmentedButton = [[SegmentedButton alloc]initWithFrame:CGRectMake(10.0f, IPHONE_HEIGHT - 70.0f, 300.0f, 46.0f)];
    segmentedButtonView = [[SegmentedButton alloc]initWithFrame:CGRectMake(10.0f, IPHONE_HEIGHT - 70.0f, 300.0f, 46.0f)];
    [self.view addSubview:segmentedButtonView];
    [self.view addSubview:imageSegmentedButton];
    
    [imageSegmentedButton initWithImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"settings"], [UIImage imageNamed:@"settings"], [UIImage imageNamed:@"settings"], [UIImage imageNamed:@"settings"], [UIImage imageNamed:@"settings"], [UIImage imageNamed:@"settings"], nil] buttonTintNormal:nil buttonTintPressed:nil actionHandler:^(int buttonIndex) {
        [self DidSelectItemWithTag:buttonIndex];
        NSLog(@"Button pressed at index %i", buttonIndex);
    }];
    
    carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0.0f, 90.0f, 320.0f, IPHONE_HEIGHT - 200.0f)];
//    carousel.backgroundColor = REDColor;
    carousel.decelerationRate = 0.5;
    carousel.delegate = self;
    carousel.dataSource = self;
    carousel.type = iCarouselTypeRotary;
    [self.view addSubview:carousel];
    
    UIButton *questionBtn = [[UIButton alloc]initWithFrame:CGRectMake(262.0f, 13.0f, 44.0f, 44.0f)];
    [questionBtn setBackgroundImage:[UIImage imageNamed:@"form.png"] forState:UIControlStateNormal];
    [questionBtn addTarget:self action:@selector(question:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:questionBtn];
}

#pragma mark
#pragma mark - ViewLifeCycle method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initWithData];
	[self initWithControl];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
}

#pragma mark -
#pragma mark - operation

- (void)question:(UIButton *)sender
{
    RadioButtonViewController * radioButtonViewController = [[RadioButtonViewController alloc]init];
    [self presentModalViewController:radioButtonViewController animated:YES];
}

- (void)DidSelectItemWithTag:(int)tag {
    switch (tag) {
        case 0:
        {
            BTCocktailViewController *btCocktailViewController = [[BTCocktailViewController alloc]init];
            [self.navigationController pushViewController:btCocktailViewController animated:YES];            
        }
            break;
        case 1:
//        {
//            UIViewController *btCocktailViewController = [[UIViewController alloc]init];
//            UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT)];
//            [backgoundView setImage:[UIImage imageNamed:@"background.png"]];
//            [self.view addSubview:backgoundView];
//            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            backButton.frame = CGRectMake(15, 10, 40, 20);
//            backButton.backgroundColor = REDColor;
//            [backButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
//            [btCocktailViewController.view addSubview:backgoundView];
//            [btCocktailViewController.view addSubview:backButton];
//            [self.navigationController pushViewController:btCocktailViewController animated:YES];
//        }
            break;
        case 2:
//        {
//            UIViewController *btCocktailViewController = [[UIViewController alloc]init];
//            UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT)];
//            [backgoundView setImage:[UIImage imageNamed:@"thirdViewController.png"]];
//            [self.view addSubview:backgoundView];
//            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            backButton.frame = CGRectMake(15, 10, 40, 20);
////            backButton.backgroundColor = REDColor;
//            [backButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
//            [btCocktailViewController.view addSubview:backgoundView];
//            [btCocktailViewController.view addSubview:backButton];
//            [self.navigationController pushViewController:btCocktailViewController animated:YES];
//        }
            break;
        case 3:
//        {
//            UIViewController *btCocktailViewController = [[UIViewController alloc]init];
//            UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT)];
//            [backgoundView setImage:[UIImage imageNamed:@"background.png"]];
//            [self.view addSubview:backgoundView];
//            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            backButton.frame = CGRectMake(15, 10, 40, 20);
//            backButton.backgroundColor = REDColor;
//            [backButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
//            [btCocktailViewController.view addSubview:backgoundView];
//            [btCocktailViewController.view addSubview:backButton];
//            [self.navigationController pushViewController:btCocktailViewController animated:YES];
//        }
            break;
        case 4:
//        {
//            UIViewController *btCocktailViewController = [[UIViewController alloc]init];
//            UIImageView *backgoundView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, IPHONE_WIDTH, IPHONE_HEIGHT)];
//            [backgoundView setImage:[UIImage imageNamed:@"background.png"]];
//            [self.view addSubview:backgoundView];
//            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//            backButton.frame = CGRectMake(15, 10, 40, 20);
//            backButton.backgroundColor = REDColor;
//            [backButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
//            [btCocktailViewController.view addSubview:backgoundView];
//            [btCocktailViewController.view addSubview:backButton];
//            [self.navigationController pushViewController:btCocktailViewController animated:YES];
//        }
            break;
        case 5:
        {
            BTSettingViewController *btsettingViewController = [BTSettingViewController sharedInstance];
            self.settingViewController = btsettingViewController;
            [self.navigationController pushViewController:settingViewController animated:YES];
//            [btsettingViewController release];
        }
            break;
        default:
            break;
    }
}

- (void)dealloc {
	// UI
    carousel.delegate = nil;
	carousel.dataSource = nil;
    [carousel release];

    self.settingViewController = nil;
    [settingViewController release];
    [items release];
    [super dealloc];
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [items count];
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    //limit the number of items views loaded concurrently (for performance reasons)
    //this also affects the appearance of circular-type carousels
    return NUMBER_OF_VISIBLE_ITEMS;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UILabel *label = nil;
	
	//create new view if no view is available for recycling
	if (view == nil)
	{
        BTMainModel * mainModel = [items objectAtIndex:index];
		view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:mainModel.imagePath]] autorelease];
//		label = [[[UILabel alloc] initWithFrame:view.bounds] autorelease];
//		label.backgroundColor = [UIColor clearColor];
//		label.textAlignment = UITextAlignmentCenter;
//		label.font = [label.font fontWithSize:50];
//		[view addSubview:label];
	}
	else
	{
		label = [[view subviews] lastObject];
	}
	
    //set label
//	label.text = [[items objectAtIndex:index] stringValue];
	
	return view;
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	//note: placeholder views are only displayed on some carousels if wrapping is disabled
	return INCLUDE_PLACEHOLDERS? 2: 0;
}

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UILabel *label = nil;
	
	//create new view if no view is available for recycling
	if (view == nil)
	{
		view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page.png"]] autorelease];
		label = [[[UILabel alloc] initWithFrame:view.bounds] autorelease];
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		label.font = [label.font fontWithSize:50.0f];
		[view addSubview:label];
	}
	else
	{
		label = [[view subviews] lastObject];
	}
	
    //set label
	label.text = (index == 0)? @"[": @"]";
	
	return view;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    return ITEM_SPACING;
}

- (CGFloat)carousel:(iCarousel *)carousel itemAlphaForOffset:(CGFloat)offset
{
	//set opacity based on distance from camera
    return 1.0f - fminf(fmaxf(offset, 0.0f), 1.0f);
}

- (CATransform3D)carousel:(iCarousel *)_carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return wrap;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    DLog(@"选择了第%d个..",index);
}

- (void)backView:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end