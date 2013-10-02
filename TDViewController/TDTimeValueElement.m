//
//  TDTimeValueElement.m
//  resttimer
//
//  Created by Evgeny Rusanov on 22.03.13.
//  Copyright (c) 2013 xCoders. All rights reserved.
//

#import "TDTimeValueElement.h"

#import "TimeHelper.h"

@implementation TDTimeValueElement

-(id)initWithText:(NSString *)text andValue:(double)value
{
    self = [super initWithText:text];
    if (self)
    {
        self.value = value;
    }
    return self;
}

+(TDTimeValueElement*)timeValueElementWithText:(NSString*)text andValue:(double)value;
{
    return [[TDTimeValueElement alloc] initWithText:text andValue:value];
}

-(id)initWithText:(NSString *)text andValue:(double)value andKey:(NSString*)key
{
    self = [self initWithText:text andValue:value];
    self.key = key;
    return self;
}

+(TDTimeValueElement*)timeValueElementWithText:(NSString*)text andValue:(double)value andKey:(NSString*)key
{
    return [[TDTimeValueElement alloc] initWithText:text andValue:value andKey:key];
}

-(NSString*)toHtml
{
    TimeHelper *th = [[TimeHelper alloc] initWithSeconds:self.value];
    return [NSString stringWithFormat:@"%@: %@<br>",self.text,[th convertToString_HHmm]];
}

-(void)storeElementValueTo:(NSMutableDictionary *)dict
{
    if (self.key.length)
        [dict setValue:[NSNumber numberWithDouble:self.value]forKey:self.key];
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
    
    TimeHelper *th = [[TimeHelper alloc] initWithSeconds:self.value];
    
    cell.textLabel.text = self.text;
    cell.detailTextLabel.text = [th convertToString_HHmm];
    
    return cell;
}

-(NSString*)cellIdentifer
{
    return @"TDTimeValueElement";
}


@end
