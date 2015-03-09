//
//  TDDescriptionElement.m
//  iDrugs
//
//  Created by Evgeny Rusanov on 03.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDMultilineTextElement.h"

#import "TDElement+CellCreation.h"

#import "UITableViewCell+Helpers.h"

@implementation TDMultilineTextElement

-(CGFloat)height
{
    CGFloat width = [UITableViewCell groupedCellWidth:[UIApplication sharedApplication].statusBarOrientation] - 20;
    CGFloat height = [super height];
    
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:@{NSFontAttributeName : self.elementFont}
                                          context:nil];
    
    return MAX(height, rect.size.height+6);
}

#pragma mark - cell creation

-(UITableViewCell*)createCellIn:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath
{
    NSString *cellIdentifer = [self cellIdentifer];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = self.elementFont;
        cell.textLabel.textAlignment = self.textAlign;
        cell.accessoryType = self.accessoryType;
    }
    
    cell.textLabel.text = self.text;
    
    return cell;
}

-(NSString*)cellIdentifer
{
    return @"TDDescriptionElementCell";
}

@end
