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

@interface BTSettingViewController ()

@end

@implementation BTSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
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
    settingtableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT) style:UITableViewStyleGrouped];
    settingtableView.dataSource = self;
    settingtableView.delegate = self;
    [self.view addSubview:settingtableView];
    [settingtableView release];
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
        cell = [[[BTSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifity]autorelease];
    }
    
    cell.textLabel.text = [contentArray objectAtIndex:indexPath.row];
    
    cell.selectedBackgroundView = [[[UIView alloc]initWithFrame:cell.frame]autorelease];
    cell.selectedBackgroundView.backgroundColor = [UIColor lightGrayColor];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            BTAboutusViewController *btaboutusViewController = [[BTAboutusViewController alloc]init];
            [self.navigationController pushViewController:btaboutusViewController animated:YES];
            [btaboutusViewController release];
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
            
        }
            
            break;
        case 3:
        {
            
        }
            
            break;
        case 4:
        {
            
        }
            
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
