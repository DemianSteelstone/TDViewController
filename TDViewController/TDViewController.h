//
//  TDViewController.h
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDRoot;

@interface TDViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readonly) TDRoot *root;
@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic) UITableViewStyle style;

-(id)initWithRoot:(TDRoot*)root tableViewStyle:(UITableViewStyle)tableViewStyle;

-(void)updateRoot:(TDRoot*)root;

@end
