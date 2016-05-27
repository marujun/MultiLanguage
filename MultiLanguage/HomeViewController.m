//
//  HomeViewController.m
//  MultiLanguage
//
//  Created by marujun on 16/5/27.
//  Copyright © 2016年 MaRuJun. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"

@interface HomeViewController () <UIActionSheetDelegate>
{
    UILabel *_codeLabel;
    
    __weak IBOutlet UITextView *_textView;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 60)];
    _codeLabel.backgroundColor = [UIColor lightGrayColor];
    _codeLabel.textColor = [UIColor whiteColor];
    _codeLabel.textAlignment = NSTextAlignmentCenter;
    _codeLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_codeLabel];
    
    _codeLabel.text = USLocalizedString(@"代码创建的",nil);
    
    _textView.text = NSLocalizedStringFromTable(@"872-Ba-vEf.text", NSStringFromClass([self class]), @"");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _codeLabel.center = self.view.center;
}

- (IBAction)switchButtonAction:(UIButton *)sender
{
    UIActionSheet *sheetView = [[UIActionSheet alloc] initWithTitle:USLocalizedString(@"选择语言",nil)delegate:self cancelButtonTitle:USLocalizedString(@"取消",nil)destructiveButtonTitle:nil otherButtonTitles:USLocalizedString(@"简体中文",nil),USLocalizedString(@"英文",nil), nil];
    [sheetView showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0: {
            [self didSeleteLanguage:@"zh-Hans"];
        }
            break;
            
        case 1: {
            [self didSeleteLanguage:@"en"];
        }
            break;
            
        default:
            break;
    }
}

- (void)didSeleteLanguage:(NSString *)language
{
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:UserDefaultKey_AppLanguage];
    [NSBundle setLanguage:language];
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate resetWindowRootViewController];
}

- (void)dealloc
{
    NSLog(@"dealloc 释放类 %@",  NSStringFromClass([self class]));
}

@end
