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
    UITextField *_textField;
    
    TDLabeledTextFieldElement *_element;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        
        [_textField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
        
        [self.contentView addSubview:_label];
        [self.contentView addSubview:_textField];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_label sizeToFit];
    [_textField sizeToFit];
    
    CGRect labelFrame = _label.frame;
    labelFrame.origin.x = 15.0;
    labelFrame.origin.y = (self.contentView.bounds.size.height - labelFrame.size.height)*0.5;
    
    _label.frame = labelFrame;
    
    CGRect textFieldFrame = _textField.frame;
    textFieldFrame.origin.x = 10.0 + labelFrame.size.width + labelFrame.origin.x;
    textFieldFrame.origin.y = (self.contentView.bounds.size.height - textFieldFrame.size.height)*0.5;
    textFieldFrame.size.width = self.contentView.bounds.size.width - textFieldFrame.origin.x - 15.0;
    
    _textField.frame = textFieldFrame;
}

-(void)updateCell
{
    _label.text = _element.labelText;
    _label.font = _element.labelFont;
    
    _textField.text = _element.value;
    _textField.placeholder = _element.placeholder;
    _textField.font = _element.textFieldFont;
}

-(void)setElement:(TDLabeledTextFieldElement*)element
{
    _element = element;
    [self updateCell];
}

-(void)textChanged
{
    _element.value = _textField.text;
}

@end
