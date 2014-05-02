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

-(void) setDel: (id) del
{
    self.delegate = del;
}

- (void)setTaskListTitle:(id)newDetailItem
{
    if (_taskListTitle != newDetailItem) {
        _taskListTitle = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)setTaskItem:(id)newDetailItem
{
    if (_taskItem != newDetailItem)
    {
        _taskItem = newDetailItem;
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.taskItem) {
        self.taskTitleField.text = [self.taskItem valueForKey:@"taskTitle"];//self.taskItem.taskTitle;
        self.taskDescriptionField.text = [self.taskItem valueForKey:@"taskDescription"];//self.taskItem.taskDescription;
        
        /*-----------------------------------------------------------------------*/
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat: @"dd/MM/yyyy"];
        NSString *tempString = [formatter stringFromDate: [self.taskItem valueForKey:@"taskDueDate"]];
        
        /*-----------------------------------------------------------------------*/
        
        self.taskDueDateField.text = tempString;
        self.navigationItem.title = [self.taskItem valueForKey:@"taskTitle"];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editSegue"]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"dd/MM/yyyy"];
        [[segue destinationViewController] setTaskItem: self.taskItem];
        [[segue destinationViewController] setDelegate: self.delegate];
        [[segue destinationViewController] setTaskListTitle: _taskListTitle];
    }
}
@end
