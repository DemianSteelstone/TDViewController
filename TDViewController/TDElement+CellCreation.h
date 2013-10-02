//
//  TDElement+CellCreation.h
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDElement.h"

@interface TDElement (CellCreation)
-(UITableViewCell*)createCellIn:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;
-(NSString*)cellIdentifer;
@end
