//
//  TDTextFieldCell.m
//  photomovie
//
//  Created by Evgeny Rusanov on 30.10.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDTextFieldCell.h"

@interface TDTextFieldCell () <UITextFieldDelegate>

@end

@implementation TDTextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.delegate = self;
        
        [_textField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
        [self.contentView addSubview:_textField];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.textField.frame = CGRectMake(15, 0, self.contentView.frame.size.width - 15, self.contentView.frame.size.height);
}

-(void)updateCellContents
{
    _textField.placeholder = _element.placeholder;
    _textField.text = _element.value;
    _textField.secureTextEntry = _element.isSecure;
    _textField.autocapitalizationType = _element.autocapitalizationType;
    _textField.autocorrectionType = _element.autocorrectionType;
    _textField.clearButtonMode = _element.clearButtonMode;
    
    _textField.enabled = _element.enabled;
    _textField.delegate = self;
    
    if (_element.enabled)
        _textField.textColor = [UIColor blackColor];
    else
        _textField.textColor = [UIColor darkGrayColor];
}

-(void)setElement:(TDTextFieldElement *)element
{
    _element = element;
    [self updateCellContents];
}

-(void)textChanged
{
    _element.value = _textField.text;
}

-(void)setInputFocus
{
    [_textField becomeFirstResponder];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (_element.didSelectHandler)
        _element.didSelectHandler(_element);
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_element.didEndEditingHandler)
    {
        _element.didEndEditingHandler(_element);
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textField resignFirstResponder];
    return YES;
}

@end
