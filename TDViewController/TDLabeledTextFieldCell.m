//
//  TDLabeledTextFieldCell.m
//  photomovie
//
//  Created by Evgeny Rusanov on 05.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import "TDLabeledTextFieldCell.h"

#import "TDLabeledTextFieldElement.h"

@implementation TDLabeledTextFieldCell
{
    UILabel *_label;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_label];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_label sizeToFit];
    [self.textField sizeToFit];
    
    CGRect labelFrame = _label.frame;
    labelFrame.origin.x = self.contentOffset;
    labelFrame.origin.y = (self.contentView.bounds.size.height - labelFrame.size.height)*0.5;
    
    _label.frame = labelFrame;
    
    CGRect textFieldFrame = self.textField.frame;
    textFieldFrame.origin.x = 10.0 + labelFrame.size.width + labelFrame.origin.x;
    textFieldFrame.origin.y = (self.contentView.bounds.size.height - textFieldFrame.size.height)*0.5;
    textFieldFrame.size.width = self.contentView.bounds.size.width - textFieldFrame.origin.x - self.contentOffset;
    
    self.textField.frame = textFieldFrame;
}

-(void)updateCellContents
{
    [super updateCellContents];
    _label.text = ((TDLabeledTextFieldElement *)self.element).labelText;
    _label.font = ((TDLabeledTextFieldElement *)self.element).labelFont;
}

@end
