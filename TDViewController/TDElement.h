//
//  TDElement.h
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDElement : NSObject

@property (nonatomic,strong) NSString *key;

@property (nonatomic, getter = height) float height;
@property (nonatomic,copy) void (^didSelectHandler)(TDElement* element);

-(NSString*)toHtml;
-(void)storeElementValueTo:(NSMutableDictionary*)dict;

-(void)elementDidSelected;

@end
