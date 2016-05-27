//
//  NSBundle+Localizations.h
//  MultiLanguage
//
//  Created by marujun on 16/5/27.
//  Copyright © 2016年 MaRuJun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const UserDefaultKey_AppLanguage;


/** 根据用户选择 切换语言 。系统宏定义必须跟随系统的默认语言！ */
#define USLocalizedString(key,tbl) [NSString stringWithFormat:@"%@",[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:UserDefaultKey_AppLanguage]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:(tbl?:@"Localizable")]]


@interface BundleEx : NSBundle

@end

@interface NSBundle (Localizations)

+ (void)setLanguage:(NSString *)language;

@end
