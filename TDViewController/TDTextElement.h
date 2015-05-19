//
//  TDTextElement.h
//  photomovie
//
//  Created by Evgeny Rusanov on 30.10.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDElement.h"

@interface TDTextElement : TDElement

@property (nonatomic,strong) NSString *text;

@property (nonatomic,strong) UIFont *elementFont;
@property (nonatomic) NSTextAlignment textAlign;
@property (nonatomic,getter = adjustsFontSizeToFitWidth) BOOL adjustFontSizeToFitWidth;

-(instancetype)initWithText:(NSString*)text;
+(instancetype)elementWithText:(NSString*)text;

-(instancetype)initWithText:(NSString*)text andKey:(NSString*)key;
+(instancetype)elementWithText:(NSString*)text andKey:(NSString*)key;

@end
