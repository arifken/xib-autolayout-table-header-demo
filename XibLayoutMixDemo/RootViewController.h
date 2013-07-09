/*!
 * \file    RootViewControlelr
 * \project 
 * \author  Andy Rifken 
 * \date    7/8/13.
 *
 */



#import <Foundation/Foundation.h>

@class ToolbarView;
@class InfoView;


@interface RootViewController : UIViewController

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) InfoView *metaView;
@property(nonatomic, strong) ToolbarView *toolbarView;

@end