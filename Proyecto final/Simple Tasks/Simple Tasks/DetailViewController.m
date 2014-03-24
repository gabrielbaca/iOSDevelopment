//
//  DetailViewController.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "DetailViewController.h"
#import "TaskTableViewController.h"
@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.taskItem) {
        self.taskTitleField.text = self.taskItem.taskTitle;
    }
}

- (void)setTaskItem:(id)newDetailItem
{
    if (_taskItem != newDetailItem) {
        _taskItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
