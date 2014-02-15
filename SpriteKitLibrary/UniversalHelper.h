//
//  UniversalHelper.h
//  WhatsMoji
//
//  Created by Hijazi on 2/16/14.
//  Copyright (c) 2014 iReka Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

/*  DETERMINE THE DEVICE USED  */
#ifdef UI_USER_INTERFACE_IDIOM()
#define IS_IPAD() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#else
#define IS_IPAD() (NO)
#endif

/*  Universal support for Physics */
#define PTM_RATIO ((UI_USER_INTERFACE_IDIOM() == \
UIUserInterfaceIdiomPad) ? 32 : 16)
#define PTM_RATIO_FLOAT ((UI_USER_INTERFACE_IDIOM() == \
UIUserInterfaceIdiomPad) ? 32.0f : 16.0f)
#define IF_IPAD_TWO (IS_IPAD() == YES ? 2.0f : 1)
#define IF_IPAD_ONE (IS_IPAD() == YES ? 1 : 2.0f)


/*  NORMAL DETAILS */
#define kScreenHeight       480
#define kScreenWidth        320

/* OFFSETS TO ACCOMMODATE IPAD */
#define kXoffsetiPad        64
#define kYoffsetiPad        32

#define kXoffsetIfiPad	(IS_IPAD() == YES ? kXoffsetiPad : 0)
#define kYoffsetIfiPad	(IS_IPAD() == YES ? kYoffsetiPad : 0)

#define SD_PNG     @""
#define HD_PNG     @"-hd"

#define SD_PLIST     @".plist"
#define HD_PLIST     @"-hd.plist"

#define UNI_CCP(__p__)  (IS_IPAD() == YES ? ccp( ( __p__.x * 2 ) + kXoffsetiPad, ( __p__.y * 2 ) + kYoffsetiPad ) : __p__)
#define UNI_REVERSE_CCP(__p__)  (IS_IPAD() == NO ? ccp( ( __p__.x - kXoffsetiPad ) / 2, ( __p__.y - kYoffsetiPad ) / 2 ) : __p__)

#define UNI_PNG_FILE(__filename__) (IS_IPAD() == YES ? [__filename__ stringByReplacingOccurrencesOfString:SD_PNG withString:HD_PNG] : __filename__)

#define UNI_PLIST_FILE(__filename__) (IS_IPAD() == YES ? [__filename__ stringByReplacingOccurrencesOfString:SD_PLIST withString:HD_PLIST] : __filename__)
