//
//  TDSection.m
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDSection.h"
#import "TDElement.h"

@implementation TDSection
{
    NSMutableArray *_elements;
}

-(id)initWithTitle:(NSString*)title
{
    self = [super init];
    if (self)
    {
        self.title = title;
        
        _elements = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+(TDSection*)sectionWithTitle:(NSString*)title
{
    return [[TDSection alloc] initWithTitle:title];
}

-(NSArray*)elements
{
    return _elements;
}

-(void)addElement:(TDElement *)element
{
    if (element)
        [_elements addObject:element];
}

-(void)addElements:(NSArray*)elements
{
    [_elements addObjectsFromArray:elements];
}

-(NSString*)toHtml
{
    NSMutableString *string = [NSMutableString string];
    
    if (self.title)
        [string appendFormat:@"<b>%@</b><br>",self.title];
    
    for (TDElement *element in _elements)
    {
        [string appendString:[element toHtml]];
    }
    
    return string;
}

-(void)storeElementsValuesTo:(NSMutableDictionary*)dictionary
{
    for (TDElement *element in _elements)
        [element storeElementValueTo:dictionary];
}

@end
