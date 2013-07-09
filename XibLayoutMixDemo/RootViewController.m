/*!
 * \file    RootViewControlelr
 * \project 
 * \author  Andy Rifken 
 * \date    7/8/13.
 *
 */

#import "RootViewController.h"
#import "InfoView.h"
#import "ToolbarView.h"

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];


    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 200)];

    NSArray *xibViews = [[NSBundle mainBundle] loadNibNamed:@"CustomViews" owner:self
                                                    options:NULL];

    InfoView *infoView = nil;
    ToolbarView *toolbarView = nil;

    for (id obj in xibViews) {
        if ([obj isKindOfClass:[InfoView class]]) {
            infoView = obj;
        } else if ([obj isKindOfClass:[ToolbarView class]]) {
            toolbarView = obj;
        }
    }

    infoView.messageLabel.text = @"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Vestibulum id ligula porta felis euismod semper.";

    [headerView addSubview:infoView];
    [headerView addSubview:toolbarView];

    infoView.translatesAutoresizingMaskIntoConstraints = NO;
    toolbarView.translatesAutoresizingMaskIntoConstraints = NO;


    NSMutableArray *layoutConstraints = [[NSMutableArray alloc] init];

    [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[infoView]|"
                                                                                   options:(NSLayoutFormatOptions) 0
                                                                                   metrics:nil
                                                                                     views:NSDictionaryOfVariableBindings(infoView)]];


    [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[toolbarView]|"
                                                                                   options:(NSLayoutFormatOptions) 0
                                                                                   metrics:nil
                                                                                     views:NSDictionaryOfVariableBindings(toolbarView)]];

    [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[infoView][toolbarView(50)]"
                                                                                   options:(NSLayoutFormatOptions) 0
                                                                                   metrics:nil
                                                                                     views:NSDictionaryOfVariableBindings(infoView, toolbarView)]];

    [headerView addConstraints:layoutConstraints];

    self.toolbarView = toolbarView;
    self.metaView = infoView;

    [headerView layoutIfNeeded];

    CGFloat height = CGRectGetMaxY(self.toolbarView.frame);
    headerView.frame = CGRectMake(0, 0, 320, height);
    self.tableView.tableHeaderView = headerView;
}


@end


