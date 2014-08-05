//
//  TDLabeledTextFieldCell.h
//  photomovie
//
//  Created by Evgeny Rusanov on 05.08.14.
//  Copyright (c) 2014 Macsoftex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDLabeledTextFieldElement;

@interface TDLabeledTextFieldCell : UITableViewCell <UITextFieldDelegate>

-(void)setElement:(TDLabeledTextFieldElement*)element;

@end
