//
//  BTParentViewController.h
//  GDBWTA
//
//  Created by 朱 欣 on 13-7-21.
//  Copyright (c) 2013年 Air. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTParentViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate>
{
    UIImageView *_headerImageView;    // 视图顶部的图片
    UILabel *_headerLabel;            // 标题
    UIButton *_backButton;            // 返回按钮
    UIButton *_confirmButton;         // 确认按钮
}

- (void)onConfirm:(UIButton *)sender;    //需要被子类重载的方法
- (void)backView:(UIButton *)sender;    //需要被子类重载的方法
@end
