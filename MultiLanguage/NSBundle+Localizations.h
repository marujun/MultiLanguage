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


/** 根据用户选择 更换语言 */
#define USLocalizedString(key) [NSString stringWithFormat:@"%@",[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:UserDefaultKey_AppLanguage]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"USLocalized"]]


/** 使用系统默认语言 */
//#define USLocalizedString(key) NSLocalizedStringFromTable(key, @"USLocalized", nil)


@interface BundleEx : NSBundle

@end

@interface NSBundle (Localizations)

+ (void)setLanguage:(NSString *)language;

@end

@interface UITextView (Localizations)

@end
