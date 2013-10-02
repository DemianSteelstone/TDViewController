//
//  TDRoot.m
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDRoot.h"

#import "TDSection.h"
#import "TDElement.h"

@implementation TDRoot
{
    NSMutableArray *_sections;
}

-(id)initWithTitle:(NSString*)title
{
    self = [super init];
    if (self)
    {
        self.title = title;
        
        _sections = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+(TDRoot*)rootWithTitle:(NSString*)title
{
    return [[TDRoot alloc] initWithTitle:title];
}

-(NSArray*)sections
{
    return _sections;
}

-(void)addSection:(TDSection*)section
{
    if (section)
        [_sections addObject:section];
}

-(void)addSections:(NSArray*)sections
{
    [_sections addObjectsFromArray:sections];
}

-(TDElement*)elementFor:(NSIndexPath *)indexPath
{
    TDSection *section = [self.sections objectAtIndex:indexPath.section];
    return [section.elements objectAtIndex:indexPath.row];
}

-(NSString*)toHtml
{
    NSMutableString *string = [NSMutableString string];
    for (TDSection *section in _sections)
    {
        [string appendString:[section toHtml]];
    }
    return string;
}

-(NSDictionary*)elementsValues
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    for (TDSection *section in _sections)
        [section storeElementsValuesTo:dictionary];
    
    return dictionary;
}

@end
