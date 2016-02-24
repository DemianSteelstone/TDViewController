//
//  TDSwitchCell.m
//  DownloaderPlus
//
//  Created by Evgeny Rusanov on 13.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "TDSwitchCell.h"

#import "TDSwitchElement.h"

@implementation TDSwitchCell
{
    UILabel *_label;
    UISwitch *_switch;
    
    TDSwitchElement *_element;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _switch = [[UISwitch alloc] initWithFrame:CGRectZero];
        _label.font = [UIFont boldSystemFontOfSize:14];
        _label.numberOfLines = 2;
        
        [_switch addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
        
        [self.contentView addSubview:_label];
        [self.contentView addSubview:_switch];
    }
    
    return self;
}

-(void)valueChanged
{
    _element.value = _switch.on;
}

-(void)setElement:(TDSwitchElement *)element
{
    _element = element;
    
    [self updateCell];
}

-(void)updateCell
{
    _label.text = _element.text;
    _switch.on = _element.value;
    
    _label.textAlignment = _element.textAlign;
    _label.font = _element.elementFont;
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    [_switch sizeToFit];

    CGFloat labelWidth = self.contentView.bounds.size.width - 2*15.0 - _switch.frame.size.width - 5.0;
    CGSize labelSize = [_label sizeThatFits:CGSizeMake(labelWidth, 0)];
    CGRect labelFrame = _label.frame;
    labelFrame.origin.x = 15.0;
    labelFrame.size.width = labelWidth;
    labelFrame.size.height = labelSize.height;
    labelFrame.origin.y = (self.contentView.bounds.size.height - labelFrame.size.height)*0.5;
    
    _label.frame = labelFrame;
    
    CGRect switchFrame = _switch.frame;
    switchFrame.origin.y = (self.contentView.bounds.size.height - switchFrame.size.height)*0.5;
    switchFrame.origin.x = labelFrame.origin.x + labelFrame.size.width + 5.0;
    
    _switch.frame = switchFrame;
}

@end
