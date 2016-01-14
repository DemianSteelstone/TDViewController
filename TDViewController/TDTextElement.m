//
//  TDTextElement.m
//  photomovie
//
//  Created by Evgeny Rusanov on 30.10.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDTextElement.h"

#import "TDElement+CellCreation.h"
#import "TDTableCell.h"

@implementation TDTextElement

-(id)initWithText:(NSString*)text
{
    if (self = [super init])
    {
        self.elementFont = [UIFont systemFontOfSize:17];
        self.textAlign = NSTextAlignmentLeft;
        self.adjustFontSizeToFitWidth = YES;
        
        self.text = text;
        self.key = text;
    }
    return self;
}

+(instancetype)elementWithText:(NSString*)text
{
    return [[self alloc] initWithText:text];
}

-(instancetype)initWithText:(NSString*)text andKey:(NSString*)key
{
    self = [self initWithText:text];
    self.key = key;
    return self;
}

+(instancetype)elementWithText:(NSString*)text andKey:(NSString*)key
{
    return [[self alloc] initWithText:text andKey:key];
}

-(NSString*)toHtml
{
    return [NSString stringWithFormat:@"%@<br>",self.text];
}

-(void)storeElementValueTo:(NSMutableDictionary*)dict
{
    if (self.key.length)
        [dict setValue:self.text forKey:self.key];
}


#pragma mark - cell creation

-(UITableViewCell*)createCellIn:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath
{
    NSString *cellIdentifer = [self cellIdentifer];
    TDTableCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell)
    {
        cell = [[TDTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = self.elementFont;
        cell.textLabel.minimumScaleFactor = 0.5;
        cell.textLabel.adjustsFontSizeToFitWidth = self.adjustFontSizeToFitWidth;
        cell.textLabel.textAlignment = self.textAlign;
    }
    
    cell.accessoryType = self.accessoryType;
    cell.textLabel.text = self.text;
    
    return cell;
}

-(NSString*)cellIdentifer
{
    return @"TDElementCell";
}

@end
