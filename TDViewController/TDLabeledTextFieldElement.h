//
//  TDLabeledTextFieldElement.h
//  photomovie
//
//  Created by Evgeny Rusanov on 05.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "TDElement.h"

@interface TDLabeledTextFieldElement : TDElement

@property (nonatomic, strong) NSString *labelText;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSString *value;
@property (nonatomic) BOOL isSecure;
@property (nonatomic, strong) UIFont *labelFont;
@property (nonatomic, strong) UIFont *textFieldFont;

-(id)initWithLabelText:(NSString*)label placaholder:(NSString*)placeHolder value:(NSString*)value;
-(id)initWithLabelText:(NSString*)label placaholder:(NSString*)placeHolder value:(NSString*)value key:(NSString*)key;

@end
