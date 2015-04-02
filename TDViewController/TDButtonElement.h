//
//  TDButtonElement.h
//  photomovie
//
//  Created by Evgeny Rusanov on 01.11.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDElement.h"

@interface TDButtonElement : TDElement

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIColor *textColor;

-(id)initWithTitle:(NSString*)title;
+(TDButtonElement*)buttonElementWithTitle:(NSString*)title;

@end
