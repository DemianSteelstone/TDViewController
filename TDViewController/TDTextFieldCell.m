//
//  TDTextFieldCell.m
//  photomovie
//
//  Created by Evgeny Rusanov on 30.10.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDTextFieldCell.h"

@implementation TDTextFieldCell
{
    TDTextFieldElement *_element;
    
    __weak IBOutlet UITextField *textField;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(TDTextFieldCell*)loadFromNib:(id)owner
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TDTextFieldCell" owner:owner options:nil];
    return (TDTextFieldCell*)[array objectAtIndex:0];
}

-(void)updateCellContents
{
    textField.placeholder = _element.placeholder;
    textField.text = _element.value;
    textField.secureTextEntry = _element.isSecure;
    
    textField.enabled = _element.enabled;
    
    if (_element.enabled)
        textField.textColor = [UIColor blackColor];
    else
        textField.textColor = [UIColor darkGrayColor];
}

-(void)setValueElement:(TDTextFieldElement*)element
{
    _element = element;
    [self updateCellContents];
}

- (IBAction)textChanged:(UITextField*)sender {
    _element.value = sender.text;
}

-(void)setInputFocus
{
    [textField becomeFirstResponder];
}

-(UITextField*)textField
{
    return textField;
}

@end
