//
//  MDPTDSwitchElement.m
//  DownloaderPlus
//
//  Created by Evgeny Rusanov on 13.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "TDSwitchElement.h"

@implementation TDSwitchElement

-(id)initWithText:(NSString *)text andValue:(BOOL)value
{
    return [self initWithText:text andValue:value andKey:nil];
}

-(id)initWithText:(NSString *)text andValue:(BOOL)value andKey:(NSString*)key
{
    if (self = [super initWithText:text andKey:key])
    {
        _value = value;
    }
    
    return self;
}

-(void)storeElementValueTo:(NSMutableDictionary *)dict
{
    if (self.key.length)
        [dict setValue:[NSNumber numberWithBool:self.value] forKey:self.key];
}

@end
