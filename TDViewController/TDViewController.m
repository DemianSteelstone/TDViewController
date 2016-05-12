//
//  TDViewController.m
//  TableDialogViewController
//
//  Created by Evgeny Rusanov on 01.03.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "TDViewController.h"
#import "TDRoot.h"
#import "TDSection.h"
#import "TDElement.h"
#import "TDElement+CellCreation.h"

#import "TDTextFieldCell.h"
#import "TDLabeledTextFieldCell.h"

#import "UITableView+InputView.h"

@implementation TDViewController

@synthesize style;

-(id)initWithRoot:(TDRoot*)root tableViewStyle:(UITableViewStyle)tableViewStyle
{
    self = [super init];
    if (self)
    {
        self.style = tableViewStyle;
        _root = root;
        self.shouldIntendOnKeyboardShow = YES;

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidChange:)
                                                     name:UIKeyboardDidChangeFrameNotification
                                                   object:nil];
    }
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -

-(void)keyboardWillHide:(NSNotification*)n
{
    if (NO == self.shouldIntendOnKeyboardShow)
        return;
    
    CGRect rect = [n.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    double duration = [n.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [self.tableView keyboardWillHide:rect duration:duration];
}

-(void)keyboardDidChange:(NSNotification*)n
{
    if (NO == self.shouldIntendOnKeyboardShow)
        return;
    
    CGRect rect = [n.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [self.tableView keyboardDidShow:rect];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.style];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:_tableView];
    
    self.title = _root.title;
    
    if (style == UITableViewStyleGrouped)
        self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

-(void)updateRoot:(TDRoot*)root
{
    _root = root;
    self.title = _root.title;
    
    [self.tableView reloadData];
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _root.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TDSection *tdSection = [_root.sections objectAtIndex:section];
    return tdSection.elements.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDElement *element = [_root elementFor:indexPath];
    UITableViewCell *cell = [element createCellIn:tableView indexPath:indexPath];
    
    if (NO == [element isKindOfClass:NSClassFromString(@"TDButtonElement")])
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDElement *element = [_root elementFor:indexPath];
    return [element heightForWidth:self.view.frame.size.width];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    TDSection *tdSection = [_root.sections objectAtIndex:section];
    return tdSection.title;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    TDSection *tdSection = [_root.sections objectAtIndex:section];
    return tdSection.footer;
}

//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    TDSection *tdSection = [_root.sections objectAtIndex:section];
//    CGSize size = [tdSection.title sizeWithFont:[UIFont systemFontOfSize:14]];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectNull];
//    label.text = tdSection.title;
//    label.font = [UIFont systemFontOfSize:14];
//    
//    label.textColor = [UIColor whiteColor];
//    label.shadowColor = [UIColor darkGrayColor];
//    label.shadowOffset = CGSizeMake(1, -1);
//    
//    label.textAlignment = NSTextAlignmentCenter;
//    
//    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    
//    label.backgroundColor = [UIColor clearColor];
//    
//    
//    CGRect frame = label.frame;
//    frame.size = size;
//    label.frame = frame;
//    
//    return label;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    TDSection *tdSection = [_root.sections objectAtIndex:section];
//    CGSize size = [tdSection.title sizeWithFont:[UIFont systemFontOfSize:14]];
//    return size.height;
//}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[TDTextFieldCell class]])
        [(TDTextFieldCell*)cell setInputFocus];
    else if ([cell isKindOfClass:[TDLabeledTextFieldCell class]])
        [(TDLabeledTextFieldCell*)cell setInputFocus];
    else
        [[_root elementFor:indexPath] elementDidSelected];
}

@end
