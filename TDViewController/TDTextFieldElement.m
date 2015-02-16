//
//  TDTextFiledElement.m
//  photomovie
//
//  Created by Evgeny Rusanov on 30.10.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDTextFieldElement.h"

#import "TDTextFieldCell.h"
#import "TDElement+CellCreation.h"

@implementation TDTextFieldElement
{
    void (^textChangeHandler)(TDTextFieldElement *element);
}

-(id)initWithPlaceholder:(NSString*)placeholder andValue:(NSString*)value
{
    if (self = [super init])
    {
        self.placeholder = placeholder;
        self.value = value;
        self.font = [UIFont systemFontOfSize:14];
        self.enabled = YES;
    }
    return self;
}

+(TDTextFieldElement*)textFieldElementWithPlaceholder:(NSString*)placeholder andValue:(NSString*)value
{
    return [[TDTextFieldElement alloc] initWithPlaceholder:placeholder andValue:value];
}

-(id)initWithPlaceholder:(NSString*)placeholder andValue:(NSString*)value andKey:(NSString*)key
{
    if (self = [self initWithPlaceholder:placeholder andValue:value])
    {
        self.key = key;
    }
    return self;
}

+(TDTextFieldElement*)textFieldElementWithPlaceholder:(NSString*)placeholder andValue:(NSString*)value andKey:(NSString*)key
{
    return [[TDTextFieldElement alloc] initWithPlaceholder:placeholder andValue:value andKey:key];
}

-(void)dealloc
{
    if (textChangeHandler)
        [self removeObserver:self forKeyPath:@"value"];
}

-(void)setTextChangeHandler:(void (^)(TDTextFieldElement* element))handler
{
    if (textChangeHandler)
        [self removeObserver:self forKeyPath:@"value"];
    
    if (handler)
        [self addObserver:self
               forKeyPath:@"value"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    
    textChangeHandler = [handler copy];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"value"])
    {
        if (textChangeHandler)
            textChangeHandler(self);
    }
    else [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

-(void)storeElementValueTo:(NSMutableDictionary*)dict
{
    if (self.key.length)
        [dict setValue:self.value forKey:self.key];
}

#pragma mark -

-(NSString*)cellIdentifer
{
    return @"TDTextFieldElement";
}

-(UITableViewCell*)createCellIn:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    TDTextFieldCell *cell = (TDTextFieldCell*)[tableView dequeueReusableCellWithIdentifier:[self cellIdentifer]];
    if (!cell)
    {
        cell = [TDTextFieldCell loadFromNib:self];
        cell.textField.font = self.font;
        cell.accessoryType = self.accessoryType;
    }
    
    [cell setValueElement:self];
    
    return cell;
}

@end
