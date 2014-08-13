//
//  MDPTDSwitchElement.h
//  DownloaderPlus
//
//  Created by Evgeny Rusanov on 13.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "TDTextElement.h"

@interface TDSwitchElement : TDTextElement

@property (nonatomic) BOOL value;

-(id)initWithText:(NSString *)text andValue:(BOOL)value;
-(id)initWithText:(NSString *)text andValue:(BOOL)value andKey:(NSString*)key;

-(void)setValueChangeHandler:(void (^)(TDSwitchElement* element))handler;

@end
