//
//  TDTableCell.m
//  TableDialogViewController
//
//  Created by Vladimir Voitekhovsky on 29.05.15.
//  Copyright (c) 2015 Kain. All rights reserved.
//

#import "TDTableCell.h"

@implementation TDTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        const CGFloat defaultContentOffset = 15;
        _contentOffset = defaultContentOffset;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect imageViewFrame = self.imageView.frame;
    CGRect textLabelFrame = self.textLabel.frame;
    CGRect detailTextLabelFrame = self.detailTextLabel.frame;
    
    CGFloat delta;
    if (self.imageView.image)
        delta = imageViewFrame.origin.x - self.contentOffset;
    else
        delta = textLabelFrame.origin.x - self.contentOffset;
    
    imageViewFrame.origin.x -= delta;
    imageViewFrame.size.width += delta;
    textLabelFrame.origin.x -= delta;
    textLabelFrame.size.width += delta;
    detailTextLabelFrame.origin.x -= delta;
    detailTextLabelFrame.size.width += delta;
    
    self.imageView.frame = imageViewFrame;
    self.textLabel.frame = textLabelFrame;
    self.detailTextLabel.frame = detailTextLabelFrame;
}

@end
