//
//  TDImageElement.h
//  iDrugs
//
//  Created by Evgeny Rusanov on 03.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDValueElement.h"

@interface TDImageElement : TDValueElement

-(id)initWithText:(NSString *)text andValue:(NSString *)value andImage:(UIImage*)image;
+(TDImageElement*)imageElementWithText:(NSString*)text andValue:(NSString*)value andImage:(UIImage*)image;

-(id)initWithText:(NSString *)text andValue:(NSString *)value andImage:(UIImage*)image andKey:(NSString*)key;
+(TDImageElement*)imageElementWithText:(NSString*)text andValue:(NSString*)value andImage:(UIImage*)image andKey:(NSString*)key;

@end
