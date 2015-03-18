//
//  TDValueElement.m
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDValueElement.h"

#import "TDElement+CellCreation.h"

@implementation TDValueElement

-(id)initWithText:(NSString *)text andValue:(NSString*)value
{
    self = [super initWithText:text];
    if (self)
    {
        self.value = value;
    }
    return self;
}

+(TDValueElement*)valueElementWithText:(NSString*)text andValue:(NSString*)value;
{
    return [[TDValueElement alloc] initWithText:text andValue:value];
}

-(id)initWithText:(NSString *)text andValue:(NSString*)value andKey:(NSString*)key
{
    self = [self initWithText:text andValue:value];
    self.key = key;
    return self;
}

+(TDValueElement*)valueElementWithText:(NSString*)text andValue:(NSString*)value andKey:(NSString*)key
{
    return [[TDValueElement alloc] initWithText:text andValue:value andKey:key];
}

-(NSString*)toHtml
{
    return [NSString stringWithFormat:@"%@: %@<br>",self.text,self.value];
}

-(void)storeElementValueTo:(NSMutableDictionary *)dict
{
    if (self.key.length)
        [dict setValue:self.value forKey:self.key];
}

#pragma mark - cell creation

-(UITableViewCell*)createCellIn:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath
{
    NSString *cellIdentifer = [self cellIdentifer];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                       reuseIdentifier:cellIdentifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = self.elementFont;
        
        cell.textLabel.textAlignment = self.textAlign;
    }
    
    cell.accessoryType = self.accessoryType;
    cell.textLabel.text = self.text;
    cell.detailTextLabel.text = self.value;
    
    return cell;
}

-(NSString*)cellIdentifer
{
    return @"TDValueElementCell";
}

@end
