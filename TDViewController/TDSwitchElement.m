//
//  MDPTDSwitchElement.m
//  DownloaderPlus
//
//  Created by Evgeny Rusanov on 13.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "TDSwitchElement.h"

#import "TDSwitchCell.h"

@implementation TDSwitchElement
{
    void (^_changeHandler)(TDSwitchElement *element);
}

-(id)initWithText:(NSString *)text andValue:(BOOL)value
{
    return [self initWithText:text andValue:value andKey:nil];
}

-(id)initWithText:(NSString *)text andValue:(BOOL)value andKey:(NSString*)key
{
    if (self = [super initWithText:text andKey:key])
    {
        _value = value;
        self.elementFont = [UIFont boldSystemFontOfSize:14];
    }
    
    return self;
}

-(void)dealloc
{
    if (_changeHandler)
        [self removeObserver:self forKeyPath:@"value"];
}

-(void)storeElementValueTo:(NSMutableDictionary *)dict
{
    if (self.key.length)
        [dict setValue:[NSNumber numberWithBool:self.value] forKey:self.key];
}

-(void)setValueChangeHandler:(void (^)(TDSwitchElement* element))handler
{
    if (_changeHandler)
        [self removeObserver:self forKeyPath:@"value"];
    
    if (handler)
        [self addObserver:self
               forKeyPath:@"value"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    
    _changeHandler = [handler copy];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"value"])
    {
        if (_changeHandler)
            _changeHandler(self);
    }
    else [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

#pragma mark -

-(NSString*)cellIdentifer
{
    return @"TDSwitchCell";
}

-(UITableViewCell*)createCellIn:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    TDSwitchCell *cell = (TDSwitchCell*)[tableView dequeueReusableCellWithIdentifier:[self cellIdentifer]];
    if (!cell)
    {
        cell = [[TDSwitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self cellIdentifer]];
        cell.accessoryType = self.accessoryType;
    }
    
    [cell setElement:self];
    
    return cell;
}

@end
