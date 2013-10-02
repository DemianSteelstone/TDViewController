//
//  TDSection.h
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

@class TDElement;

@interface TDSection: NSObject

@property (nonatomic,strong) NSString *title;

-(id)initWithTitle:(NSString *)title;
+(TDSection*)sectionWithTitle:(NSString*)title;

-(NSArray*)elements;
-(void)addElement:(TDElement*)element;
-(void)addElements:(NSArray*)elements;

-(NSString*)toHtml;
-(void)storeElementsValuesTo:(NSMutableDictionary*)dictionary;


@end
