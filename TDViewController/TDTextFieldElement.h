//
//  TDTextFiledElement.h
//  photomovie
//
//  Created by Evgeny Rusanov on 30.10.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDElement.h"

@interface TDTextFieldElement : TDElement

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSString *value;
@property (nonatomic) BOOL isSecure;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic) BOOL enabled;

-(id)initWithPlaceholder:(NSString*)placeholder andValue:(NSString*)value;
+(TDTextFieldElement*)textFieldElementWithPlaceholder:(NSString*)placeholder andValue:(NSString*)value;

-(id)initWithPlaceholder:(NSString*)placeholder andValue:(NSString*)value andKey:(NSString*)key;
+(TDTextFieldElement*)textFieldElementWithPlaceholder:(NSString*)placeholder andValue:(NSString*)value andKey:(NSString*)key;

-(void)setTextChangeHandler:(void (^)(TDTextFieldElement* element))handler;

@end
