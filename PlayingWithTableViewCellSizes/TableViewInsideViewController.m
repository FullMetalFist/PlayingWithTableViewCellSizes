//
//  TableViewInsideViewController.m
//  PlayingWithTableViewCellSizes
//
//  Created by Michael Vilabrera on 6/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "TableViewInsideViewController.h"

NSString *const kCellIdentifier = @"CellID";

@interface TableViewInsideViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView;

@end

@implementation TableViewInsideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createViews];
}

- (void) createViews
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = YES;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableView DataSource & Delegate methods

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Text label %lu", indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:(CGFloat)indexPath.row/255.0 green:(CGFloat)indexPath.row/255.0 blue:(CGFloat)indexPath.row/255.0 alpha:1.0];
    cell.textLabel.textColor = [UIColor colorWithRed:(CGFloat)(100-indexPath.row)/255.0 green:(CGFloat)(100-indexPath.row)/255.0 blue:(CGFloat)(100-indexPath.row)/255.0 alpha:1.0];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
