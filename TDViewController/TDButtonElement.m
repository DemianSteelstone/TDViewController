//
//  TDButtonElement.m
//  photomovie
//
//  Created by Evgeny Rusanov on 01.11.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDButtonElement.h"

#import "TDElement+CellCreation.h"

@implementation TDButtonElement

-(id)initWithTitle:(NSString*)title
{
    if (self = [super init])
    {
        self.title = title;
        self.textColor = [UIColor blackColor];
    }
    
    return self;
}

+(TDButtonElement*)buttonElementWithTitle:(NSString*)title
{
    return [[TDButtonElement alloc] initWithTitle:title];
}

#pragma mark - CellCreation

-(NSString*)cellIdentifer
{
    return @"TDButtonElement";
}

-(UITableViewCell*)createCellIn:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifer = [self cellIdentifer];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifer];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
        cell.textLabel.minimumScaleFactor = 0.5;
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    cell.textLabel.textColor = self.textColor;    
    cell.accessoryType = self.accessoryType;
    cell.textLabel.text = self.title;
    
    return cell;
}

@end
