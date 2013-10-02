//
//  TDValueElement.h
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDTextElement.h"

@interface TDValueElement : TDTextElement

@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) UIFont *detailFont;

-(id)initWithText:(NSString *)text andValue:(NSString*)value;
+(TDValueElement*)valueElementWithText:(NSString*)text andValue:(NSString*)value;

-(id)initWithText:(NSString *)text andValue:(NSString*)value andKey:(NSString*)key;
+(TDValueElement*)valueElementWithText:(NSString*)text andValue:(NSString*)value andKey:(NSString*)key;

@end
