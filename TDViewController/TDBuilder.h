//
//  TDBuilder.h
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDRoot;
@class TDSection;
@class TDElement;

#define kTitleKey           @"TDTitle"
#define kHeightKey          @"TDHeight"
#define kSectionsKey        @"TDSections"
#define kElementsKey        @"TDElements"
#define kElementTypeKey     @"TDElementType"

@interface TDBuilder : NSObject

+(TDRoot*)buildRootFrom:(NSDictionary*)dict;
+(NSArray*)buildSectionsFrom:(NSArray*)array;
+(TDSection*)buildSectionFrom:(NSDictionary*)dict;
+(NSArray*)buildElementsFrom:(NSArray*)array;
+(TDElement*)buildElementFrom:(NSDictionary*)dict;

@end
