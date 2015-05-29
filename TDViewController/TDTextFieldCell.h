//
//  TDTextFieldCell.h
//  photomovie
//
//  Created by Evgeny Rusanov on 30.10.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDTableCell.h"
#import "TDTextFieldElement.h"

@interface TDTextFieldCell : TDTableCell

@property (nonatomic,readonly) UITextField *textField;
@property (nonatomic) TDTextFieldElement *element;

-(void)setInputFocus;

-(void)updateCellContents;

@end
