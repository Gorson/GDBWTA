//
//  BTViewController.h
//  Created by http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>
#import "InfiniTabBar.h"
#import "iCarousel.h"
@class SegmentedButton;

@interface BTViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>
{
    
}
// DATA
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, assign) BOOL wrap;

// UI
@property (nonatomic, retain) iCarousel *carousel;
@property (strong, nonatomic)SegmentedButton *segmentedButtonView;
@property (strong, nonatomic)SegmentedButton *imageSegmentedButton;

@end