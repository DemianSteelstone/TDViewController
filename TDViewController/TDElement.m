//
//  TDElement.m
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDElement.h"

#import "TDElement+CellCreation.h"

@implementation TDElement

-(id)init
{
    self = [super init];
    if (self)
    {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

-(CGFloat)heightForWidth:(CGFloat)width
{
    return 44.0;
}

-(NSString*)toHtml
{
    return @"";
}

-(void)storeElementValueTo:(NSMutableDictionary *)dict
{
    
}

-(void)elementDidSelected
{
    if (self.didSelectHandler)
        self.didSelectHandler(self);
}

@end
