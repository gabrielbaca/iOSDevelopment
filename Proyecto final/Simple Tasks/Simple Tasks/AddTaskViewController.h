//
//  AddTaskViewController.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/31/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManagement.h"

@protocol AddTaskProtocol <NSObject>
@required
- (void) addTask: (id) task;
- (void) modTask: (id) task atIndex: (NSUInteger) arrayIndex;
- (void) removeView: (int) index;
@end

#import "Task.h"
#import "TaskTableViewController.h"


@interface AddTaskViewController : UIViewController
@property (nonatomic, strong) id <AddTaskProtocol> delegate;
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDueDateField;
@property (weak, nonatomic) IBOutlet UITextView *taskDescriptionField;
@property (weak, nonatomic) IBOutlet UITextField *taskTitleField;
@property (strong, nonatomic) id taskTitle;
@property (nonatomic, strong) Task *taskItem;
- (IBAction)donePressed:(id)sender;
- (IBAction)didTextFieldChange:(id)sender;
@end
