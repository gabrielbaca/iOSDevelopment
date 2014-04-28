//
//  AddTaskViewController.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/31/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "AddTaskViewController.h"
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
    DBManagement *services = [DBManagement instance];
    
    if (![self.taskTitleField.text isEqualToString: @""] && !self.taskItem)
    {
        Task *tmp = [[Task alloc] init];
        //[[Task alloc] initWithTitle: self.taskTitleField.text description: self.taskDescriptionField.text dueDate:self.taskDueDateField.date];
        NSDictionary *aTask = [[NSDictionary alloc] initWithObjectsAndKeys: self.taskTitleField, @"taskTitle", self.taskDescriptionField, @"taskDescription", self.taskDueDateField, @"taskDueDate", nil];
        
#warning - Task list should not be nil
        [services addTask: aTask taskList: nil];
        [self.delegate addTask: tmp];
#warning - Task List pending [services addTask: tmp taskList: parentTaskList ];
        [self.delegate removeView: 0];
    }
    else if(![self.taskTitleField.text isEqualToString: @""] && self.taskItem)
    {
        Task *tmp = [[Task alloc] init];
        //[[Task alloc] initWithTitle: self.taskTitleField.text description: self.taskDescriptionField.text dueDate:self.taskDueDateField.date];
        tmp.taskTitle = self.taskTitleField.text;
        tmp.taskDescription = self.taskDescriptionField.text;
        tmp.taskDueDate = self.taskDueDateField.date;
        NSUInteger modIndex = cellIndex;
#warning - ¿Es necesario buscar en la base de datos?
        [self.delegate modTask: tmp atIndex: modIndex];
        [self.delegate removeView: 1];
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
