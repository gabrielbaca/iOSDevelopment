//
//  AddTaskViewController.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/31/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "AddTaskViewController.h"
#import "Task.h"
@interface AddTaskViewController ()
{
    UITapGestureRecognizer *tapRecognizer;
}
@end

@implementation AddTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
        self.navigationItem.title = self.taskItem.taskTitle;
        self.taskTitleField.text = self.taskItem.taskTitle;
        self.taskDescriptionField.text = self.taskItem.taskDescription;
        self.taskDueDateField.date = self.taskDueDateField.date;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                            action:@selector(didTapAnywhere:)];
    [self configureView];
}

-(void) keyboardWillShow:(NSNotification *) note {
    [self.view addGestureRecognizer:tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification *) note
{
    [self.view removeGestureRecognizer:tapRecognizer];
}

-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.view endEditing:YES];
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

- (IBAction)donePressed:(id)sender
{
    if (![self.taskTitleField.text isEqualToString: @""])
    {
        Task *tmp = [[Task alloc] initWithTitle: self.taskTitleField.text description: self.taskDescriptionField.text dueDate:self.taskDueDateField.date];
        [self.delegate addTask: tmp];
        [self.delegate removeView];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Task title is missing" delegate:self cancelButtonTitle:NSLocalizedString(@"Ok", nil) otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)didTextFieldChange:(id)sender
{
    self.navigationItem.title = self.taskTitleField.text;
}

@end
