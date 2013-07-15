//
//  BTSettingViewController.m
//  GDBWTA
//
//  Created by HJJ on 13-7-15.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import "BTSettingViewController.h"
#import "BTSettingCell.h"
#import "BTAboutusViewController.h"
#import "CustomAlertView.h"
#import "CloNetworkUtil.h"
#import <AVFoundation/AVFoundation.h>

@interface BTSettingViewController ()

@end

@implementation BTSettingViewController

static BTSettingViewController *_sharedSettingViewController = nil;
+ (BTSettingViewController *) sharedInstance
{
    if (_sharedSettingViewController == nil) {
        _sharedSettingViewController = [NSAllocateObject([self class], 0, NULL)init];
    }
    return _sharedSettingViewController;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        NSString *urlStr = [[NSBundle mainBundle]pathForResource:@"爱很简单" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:urlStr];
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        
        userdefaults = userdefault;
        [userdefaults setBool:YES forKey:@"playmusic"];
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [contentArray release];
    [super dealloc];
}

- (void)initWithControl
{
    settingtableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT - 180) style:UITableViewStyleGrouped];
    settingtableView.dataSource = self;
    settingtableView.delegate = self;
    settingtableView.backgroundView = nil;
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainBackgound"]];
    settingtableView.scrollEnabled = NO;
    settingtableView.backgroundView = backgroundView;
    [self.view addSubview:settingtableView];
    [settingtableView release];
    
    UISwitch *switchControl = [[UISwitch alloc]initWithFrame:CGRectMake(225, 210, 100, 30)];
    switchControl.on = YES;
    [switchControl addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [settingtableView addSubview:switchControl];
    [switchControl release];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, 425, 30, 30);
    backButton.backgroundColor = REDColor;
    [backButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}

- (void)initWithData
{
    contentArray = [[NSMutableArray alloc]initWithObjects:@"版本号",@"关于我们",@"WI-FI自动优化",@"背景音乐",@"清除缓存", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initWithData];
    [self initWithControl];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectiontitle = @"设置";
    return sectiontitle;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifity = @"PlainCell";
    BTSettingCell *cell = [settingtableView dequeueReusableCellWithIdentifier:identifity];
    if (nil == cell)
    {
        cell = [[[BTSettingCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifity]autorelease];
    }
    if (indexPath.row == 0)
    {
        cell.DetailLabel.text = @"v1.0.0";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 1)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 3)
    {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.titleLabel.text = [contentArray objectAtIndex:indexPath.row];
    
    cell.selectedBackgroundView = [[[UIView alloc]initWithFrame:cell.frame]autorelease];
    cell.selectedBackgroundView.backgroundColor = [UIColor lightGrayColor];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [settingtableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0:
        {
            return;
        }
            break;
        case 1:
        {
            BTAboutusViewController *btaboutusViewController = [[BTAboutusViewController alloc]init];
            [self.navigationController pushViewController:btaboutusViewController animated:YES];
            [btaboutusViewController release];
        }
            break;
        case 2:
        {
            CloNetworkUtil *reachability = [[CloNetworkUtil alloc]init];
            
            //判断网络
            NSMutableString *workTyoe =[NSMutableString stringWithFormat:@"你正在使用的网络是:%@", [reachability getNetWorkType]];
            NSLog(@"%@",[reachability getNetWorkType]);
            if ([reachability getNetWorkStatus] == YES)
            {
                CustomAlertView *alert = [[CustomAlertView alloc]initWithTitle:@"提示" message:workTyoe delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            }
            else
            {
                CustomAlertView *alert = [[CustomAlertView alloc]initWithTitle:@"提示" message:@"网络连接失败，请检查网络" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
                [alert show];
                [alert release];
            }
        }
            
            break;
        case 3:
        {

        }
            
            break;
        case 4:
        {
            CustomAlertView *alerView = [[CustomAlertView alloc]initWithTitle:@"是否清理缓存" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alerView show];
            [alerView release];
        }
            
            break;
            
        default:
            break;
    }
}

- (void)playmusic
{
    //player.volume = 1;
    [player prepareToPlay];

    if ([userdefaults boolForKey:@"playmusic"] == YES)
    {
        [player play];
    }
    else
    {
        [player stop];
    }
}

-(void)switchAction:(UISwitch *)sender
{
    NSLog(@"当前状态:%d",sender.on);
    if (sender.on)
    {
        [userdefaults setBool:YES forKey:@"playmusic"];
        [player play];
    }
    else
    {
        [userdefaults setBool:NO forKey:@"playmusic"];
        [player stop];
    }
}

- (void)backView:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
