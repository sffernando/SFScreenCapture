//
//  ViewController.m
//  SFScreenCapture
//
//  Created by  张亚斌 on 15/11/5.
//  Copyright © 2015年 fernando. All rights reserved.
//

#import "ViewController.h"
#import "CaptureTableViewController.h"
#import "CaptureViewViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) IBOutlet UITableView *contentTableView;
@property(nonatomic, strong) NSMutableArray *titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Screen Capture";
    _titleArray = [[NSMutableArray alloc] initWithObjects:@"Capture View",@"Capture TableView", nil];
    [_contentTableView setFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height)];
    [_contentTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        CaptureTableViewController *controller = [[CaptureTableViewController alloc] init];
        [self presentViewController:controller animated:YES completion:^{
            
        }];
    }else if (indexPath.row == 1){
        CaptureViewViewController *controller = [[CaptureViewViewController alloc] init];
        [self presentViewController:controller animated:YES completion:^{
            
        }];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
    }
    return cell;
}

@end
