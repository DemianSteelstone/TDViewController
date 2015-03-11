//
//  TDImageElement.m
//  iDrugs
//
//  Created by Evgeny Rusanov on 03.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDImageElement.h"
#import "TDElement+CellCreation.h"

@implementation TDImageElement
{
    UIImage *_image;
}

-(id)initWithText:(NSString *)text andValue:(NSString *)value andImage:(UIImage*)image
{
    self =[super initWithText:text andValue:value];
    if (self)
    {
        _image = image;
    }
    
    return self;
}

+(TDImageElement*)imageElementWithText:(NSString*)text andValue:(NSString*)value andImage:(UIImage*)image
{
    return [[TDImageElement alloc] initWithText:text andValue:value andImage:image];
}

-(id)initWithText:(NSString *)text andValue:(NSString *)value andImage:(UIImage*)image andKey:(NSString*)key
{
    self = [self initWithText:text andValue:value andImage:image];
    self.key = key;
    return self;
}

+(TDImageElement*)imageElementWithText:(NSString*)text andValue:(NSString*)value andImage:(UIImage*)image andKey:(NSString*)key
{
    return [[TDImageElement alloc] initWithText:text andValue:value andImage:image andKey:key];
}

-(CGFloat)heightForWidth:(CGFloat)width
{
    CGFloat returnHeight = [super heightForWidth:width];
    if (_image)
        returnHeight = MAX(returnHeight, _image.size.height);
    return returnHeight;
}

#pragma mark - cell creation

-(UITableViewCell*)createCellIn:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath
{
    NSString *cellIdentifer = [self cellIdentifer];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:cellIdentifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = self.elementFont;
        cell.detailTextLabel.font = self.detailFont;
        cell.textLabel.minimumScaleFactor = 0.5;
        cell.textLabel.numberOfLines = 3;
        cell.textLabel.adjustsFontSizeToFitWidth = NO;
        cell.detailTextLabel.numberOfLines = 3;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        cell.textLabel.textAlignment = self.textAlign;
        cell.accessoryType = self.accessoryType;
    }
    
    cell.textLabel.text = self.text;
    cell.detailTextLabel.text = self.value;
    cell.imageView.image = _image;
    
    return cell;
}

-(NSString*)cellIdentifer
{
    return @"TDImageElementCell";
}

@end
