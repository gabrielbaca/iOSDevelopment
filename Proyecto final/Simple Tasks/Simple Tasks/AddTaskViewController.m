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
    DBManagement *services;
    UITapGestureRecognizer *tapRecognizer;
    NSString *tempTitle;
    NSString *tempDescription;
    NSString *tempDueDate;
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
        self.navigationItem.title = [self.taskItem valueForKey:@"taskTitle"];
        self.taskTitleField.text = [self.taskItem valueForKey:@"taskTitle"];
        self.taskDescriptionField.text = [self.taskItem valueForKey:@"taskDescription"];
        self.taskDueDateField.date = [self.taskItem valueForKey:@"taskDueDate"];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    services = [DBManagement instance];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
    [self configureView];
    [self.taskTitleField becomeFirstResponder];
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
    if (![self.taskTitleField.text isEqualToString: @""] && !self.taskItem)
    {
        //TODO: hola
        NSDictionary *aTask = [[NSDictionary alloc] initWithObjectsAndKeys: self.taskTitleField.text, @"taskTitle", self.taskDescriptionField.text, @"taskDescription", self.taskDueDateField.date, @"taskDueDate", nil];
        TaskList *myTaskList = [services searchTaskList: _taskListTitle];
        [services addTask: aTask taskList: myTaskList];
        [self.delegate addTask: aTask];
        [self.delegate removeView: 0];
    }
    else if(![self.taskTitleField.text isEqualToString: @""] && self.taskItem)
    {
        NSUInteger modIndex = cellIndex;
        
        NSDictionary *aTask = [[NSDictionary alloc] initWithObjectsAndKeys: [self.taskItem valueForKey: @"taskTitle" ], @"taskTitle", [self.taskItem valueForKey: @"taskDescription"], @"taskDescription", [self.taskItem valueForKey: @"taskDueDate"], @"taskDueDate", nil];
       
        NSDictionary *modTask = [[NSDictionary alloc] initWithObjectsAndKeys: self.taskTitleField.text, @"taskTitle", self.taskDueDateField.date, @"taskDueDate", self.taskDescriptionField.text, @"taskDescription",  nil];
        
       // [services modifyTask: self.taskItem.taskTitle dueDate: self.taskItem.taskDueDate newTitle: self.taskTitleField.text newDueDate: self.taskDueDateField.date newDescription: self.taskDescriptionField.text];
        [services modifyTask: aTask newTask: modTask taskListTitle: _taskListTitle];
        [self.delegate modTask: aTask atIndex: modIndex];
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
