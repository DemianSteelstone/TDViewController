//
//  TDTextFieldCell.h
//  photomovie
//
//  Created by Evgeny Rusanov on 30.10.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDTextFieldElement.h"

@interface TDTextFieldCell : UITableViewCell

-(UITextField*)textField;

+(TDTextFieldCell*)loadFromNib:(id)owner;
-(void)setValueElement:(TDTextFieldElement*)element;

-(void)setInputFocus;

@end
