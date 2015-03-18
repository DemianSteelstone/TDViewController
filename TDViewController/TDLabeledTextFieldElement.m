//
//  TDLabeledTextFieldElement.m
//  photomovie
//
//  Created by Evgeny Rusanov on 05.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "TDLabeledTextFieldElement.h"

#import "TDLabeledTextFieldCell.h"
#import "TDElement+CellCreation.h"

@implementation TDLabeledTextFieldElement

-(id)initWithLabelText:(NSString*)label placeholder:(NSString*)placeHolder value:(NSString*)value
{
    if (self = [super initWithPlaceholder:placeHolder andValue:value])
    {
        self.labelText = label;
        self.font = [UIFont systemFontOfSize:14];
        self.labelFont = [UIFont boldSystemFontOfSize:14];
        self.enabled = YES;
    }
    return self;
}

-(id)initWithLabelText:(NSString*)label placeholder:(NSString*)placeHolder value:(NSString*)value key:(NSString*)key
{
    if (self = [self initWithLabelText:label placeholder:placeHolder value:value])
    {
        self.key = key;
    }
    return self;
}

-(void)storeElementValueTo:(NSMutableDictionary *)dict
{
    if (self.key.length)
        [dict setValue:self.value forKey:self.key];
}

#pragma mark -

-(NSString*)cellIdentifer
{
    return @"TDLabeledTextFieldCell";
}

-(UITableViewCell*)createCellIn:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    TDLabeledTextFieldCell *cell = (TDLabeledTextFieldCell*)[tableView dequeueReusableCellWithIdentifier:[self cellIdentifer]];
    if (!cell)
    {
        cell = [[TDLabeledTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self cellIdentifer]];
    }
    
    cell.accessoryType = self.accessoryType;
    [cell setElement:self];
    
    return cell;
}

@end
