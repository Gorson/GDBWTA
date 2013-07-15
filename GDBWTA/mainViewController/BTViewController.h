//
//  BTViewController.h
//  Created by http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>
#import "InfiniTabBar.h"
#import "iCarousel.h"

@interface BTViewController : UIViewController <InfiniTabBarDelegate,iCarouselDataSource, iCarouselDelegate> {
	InfiniTabBar *tabBar;
	
	// UI
	UILabel *dLabel;
	UILabel *fLabel;
}
// DATA
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, assign) BOOL wrap;

// UI
@property (nonatomic, retain) InfiniTabBar *tabBar;
@property (nonatomic, retain) iCarousel *carousel;
@property (nonatomic, retain) UILabel *dLabel;
@property (nonatomic, retain) UILabel *fLabel;

@end