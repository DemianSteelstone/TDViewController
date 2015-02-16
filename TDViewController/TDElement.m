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
        self.height = 44.0;
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

-(CGFloat)height
{
    return _height;
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
