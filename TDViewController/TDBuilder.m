//
//  TDBuilder.m
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDBuilder.h"

#import "TDRoot.h"
#import "TDSection.h"
#import "TDElement.h"

@implementation TDBuilder

+(TDRoot*)buildRootFrom:(NSDictionary*)dict
{
    NSString *title = [dict valueForKey:kTitleKey];
    
    TDRoot *root = [TDRoot rootWithTitle:title];
    
    NSArray *sections = [TDBuilder buildSectionsFrom:[dict valueForKey:kSectionsKey]];
    [root addSections:sections];
    
    return root;
}

+(NSArray*)buildSectionsFrom:(NSArray*)array
{
    NSMutableArray *sections = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array)
    {
        [sections addObject:[TDBuilder buildSectionFrom:dict]];
    }
    return sections;
}

+(TDSection*)buildSectionFrom:(NSDictionary*)dict
{
    NSString *title = [dict valueForKey:kTitleKey];
    TDSection *section = [TDSection sectionWithTitle:title];
    
    NSArray *elements = [TDBuilder buildElementsFrom:[dict valueForKey:kElementsKey]];
    [section addElements:elements];
    
    return section;
}

+(NSArray*)buildElementsFrom:(NSArray*)array
{
    NSMutableArray *elements = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array)
    {
        [elements addObject:[TDBuilder buildElementFrom:dict]];
    }
    return elements;
}

+(TDElement*)buildElementFrom:(NSDictionary*)dict
{
    NSString *type = [dict valueForKey:kElementTypeKey];
    TDElement *element = [[NSClassFromString(type) alloc] init];
    
    for (NSString *key in [dict allKeys])
    {
        if ([key isEqualToString:kElementTypeKey])
            continue;
        [element setValue:[dict valueForKey:key] forKey:key];
    }
    
    return element;
}

@end
