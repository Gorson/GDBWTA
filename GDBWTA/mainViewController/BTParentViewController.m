//
//  BTParentViewController.m
//  GDBWTA
//
//  Created by 朱 欣 on 13-7-21.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import "BTParentViewController.h"

@interface BTParentViewController ()

@end

@implementation BTParentViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initWithControl
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background.png"]];
    [self.view addSubview:backgroundView];
    
    _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(1.3f, 0.0f, 320.0f, 44.0f)];
    _headerImageView.image = [UIImage imageNamed:@"blackTabbar.png"];
    _headerImageView.userInteractionEnabled = YES;
    [self.view addSubview:_headerImageView];
    
    _backButton = [[UIButton alloc] init];
    [_backButton setFrame:CGRectMake(0.0f, 0.0f, 55.0f, 44.0f)];
    //    [_backButton setTitle:@"   返 回" forState:UIControlStateNormal];
    _backButton.titleLabel.font=[UIFont systemFontOfSize:13.0f];
    _backButton.backgroundColor = REDColor;
    [_backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //    [_backButton setBackgroundImage:[UIImage imageNamed:@"TC_NavBack.png"]forState:UIControlStateNormal];
    [_backButton addTarget:self
                    action:@selector(backView:)
          forControlEvents:UIControlEventTouchUpInside];
    
    _confirmButton = [[UIButton alloc] init];
    [_confirmButton setFrame:CGRectMake(255.0f, 5.0f, 58.0f, 32.0f)];
    //    [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
    _confirmButton.titleLabel.font=[UIFont boldSystemFontOfSize:14.0f];
    _confirmButton.backgroundColor = REDColor;
    [_confirmButton setTitleColor:BKColor forState:UIControlStateNormal];
    //    [_confirmButton setBackgroundImage:[UIImage imageNamed:@"TC_NavRightBtn.png"]forState:UIControlStateNormal];
    [_confirmButton addTarget:self
                       action:@selector(onConfirm:)
             forControlEvents:UIControlEventTouchUpInside];
    
    [_headerImageView addSubview:_confirmButton];
    [_headerImageView addSubview:_backButton];
    
    _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 12.0f, 200.0f, 20.0f)];
    _headerLabel.backgroundColor = [UIColor clearColor];
    [_headerLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
    _headerLabel.textColor = BKColor;
    _headerLabel.textAlignment = UITextAlignmentCenter;
    [_headerImageView addSubview:_headerLabel];
    
    //    UISwipeGestureRecognizer *recognizer;
    //    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    //    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    //    [[self view] addGestureRecognizer:recognizer];
    //    [recognizer release];	// Do any additional setup after loading the view.
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

/*
 确认 被子类重载
 */
-(void)onConfirm:(UIButton *)sender{
    
}

/*
 内存释放
 */
- (void)dealloc {
    [_headerImageView release];
    [_headerLabel release];
    [_backButton release];
    [_confirmButton release];
    [super dealloc];
}
@end
