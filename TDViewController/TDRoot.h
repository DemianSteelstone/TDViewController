//
//  TDRoot.h
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDSection;
@class TDElement;

@interface TDRoot : NSObject

@property (nonatomic, strong) NSString *title;

-(id)initWithTitle:(NSString*)title;
+(TDRoot*)rootWithTitle:(NSString*)title;

-(NSArray*)sections;
-(void)addSection:(TDSection*)section;
-(void)addSections:(NSArray*)sections;

-(TDElement*)elementFor:(NSIndexPath*)indexPath;

-(NSString*)toHtml;
-(NSDictionary*)elementsValues;

@end
