//
//  TDLabeledTextFieldElement.h
//  photomovie
//
//  Created by Evgeny Rusanov on 05.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "TDTextFieldElement.h"

@interface TDLabeledTextFieldElement : TDTextFieldElement

@property (nonatomic, strong) NSString *labelText;
@property (nonatomic, strong) UIFont *labelFont;

-(id)initWithLabelText:(NSString*)label placeholder:(NSString*)placeHolder value:(NSString*)value;
-(id)initWithLabelText:(NSString*)label placeholder:(NSString*)placeHolder value:(NSString*)value key:(NSString*)key;

@end
