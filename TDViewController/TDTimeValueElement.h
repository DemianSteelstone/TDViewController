//
//  TDTimeValueElement.h
//  resttimer
//
//  Created by Evgeny Rusanov on 22.03.13.
//  Copyright (c) 2013 xCoders. All rights reserved.
//

#import "TDTextElement.h"

@interface TDTimeValueElement : TDTextElement

@property (nonatomic) double value;
@property (nonatomic, strong) UIFont *detailFont;

-(id)initWithText:(NSString *)text andValue:(double)value;
+(TDTimeValueElement*)timeValueElementWithText:(NSString*)text andValue:(double)value;

-(id)initWithText:(NSString *)text andValue:(double)value andKey:(NSString*)key;
+(TDTimeValueElement*)timeValueElementWithText:(NSString*)text andValue:(double)value andKey:(NSString*)key;

@end
