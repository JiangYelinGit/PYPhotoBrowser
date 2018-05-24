//
//  NSBundle+PYPhotoBrowserExtension.h
//  PYPhotosViewExample
//
//  Created by Aaron on 2018/5/24.
//  Copyright © 2018年 iphone5solo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSBundle (PYPhotoBrowserExtension)
/**
 Get the localized string
 
 @param key     key for localized string
 @return a localized string
 */
+ (NSString *)py_localizedStringForKey:(NSString *)key;

/**
 Get the path of `PYPhotosView.bundle`.
 
 @return path of the `PYPhotosView.bundle`
 */
+ (NSBundle *)py_photoBrowserBundle;

/**
 Get the image in the `PYPhotosView.bundle` path
 
 @param name name of image
 @return a image
 */
+ (UIImage *)py_imageNamed:(NSString *)name;


@end
