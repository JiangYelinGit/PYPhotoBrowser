//
//  NSBundle+PYPhotoBrowserExtension.m
//  PYPhotosViewExample
//
//  Created by Aaron on 2018/5/24.
//  Copyright © 2018年 iphone5solo. All rights reserved.
//

#import "NSBundle+PYPhotoBrowserExtension.h"
#import "PYPhotoView.h"
@implementation NSBundle (PYPhotoBrowserExtension)
+ (NSBundle *)py_photoBrowserBundle
{
    static NSBundle *searchBundle = nil;
    if (nil == searchBundle) {
        //Default use `[NSBundle mainBundle]`.
        searchBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"PYPhotosView" ofType:@"bundle"]];
        /**
         If you use pod import and configure `use_frameworks` in Podfile, [NSBundle mainBundle] does not load the `PYPhotosView.fundle` resource file in `PYPhotosView.framework`.
         */
        if (nil == searchBundle) { // Empty description resource file in `PYPhotosView.framework`.
            searchBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[PYPhotoView class]] pathForResource:@"PYPhotosView" ofType:@"bundle"]];
        }
    }
    return searchBundle;
}

+ (NSString *)py_localizedStringForKey:(NSString *)key;
{
    return [self py_localizedStringForKey:key value:nil];
}

+ (NSString *)py_localizedStringForKey:(NSString *)key value:(NSString *)value
{
    static NSBundle *bundle = nil;
    if (nil == bundle) {
        NSString *language = [NSLocale preferredLanguages].firstObject;
        if ([language hasPrefix:@"en"]) language = @"en";
        else if ([language hasPrefix:@"es"]) language = @"es";
        else if ([language hasPrefix:@"fr"]) language = @"fr";
        else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language = @"zh-Hans";
            } else {
                language = @"zh-Hant";
            }
        } else {
            language = @"en";
        }
        
        bundle = [NSBundle bundleWithPath:[[NSBundle py_photoBrowserBundle] pathForResource:language ofType:@"lproj"]];
    }
    value = [bundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

+ (UIImage *)py_imageNamed:(NSString *)name
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    name = 3.0 == scale ? [NSString stringWithFormat:@"%@@3x.png", name] : [NSString stringWithFormat:@"%@@2x.png", name];
    UIImage *image = [UIImage imageWithContentsOfFile:[[[NSBundle py_photoBrowserBundle] resourcePath] stringByAppendingPathComponent:name]];
    return image;
}

@end
