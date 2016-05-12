//
//  TDSection.h
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDElement;

@interface TDSection: NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *footer;

-(id)initWithTitle:(NSString *)title;
+(TDSection*)sectionWithTitle:(NSString*)title;

-(NSArray*)elements;
-(void)addElement:(TDElement*)element;
-(void)addElements:(NSArray*)elements;

-(NSString*)toHtml;
-(void)storeElementsValuesTo:(NSMutableDictionary*)dictionary;


@end
