//
//  DetailViewController.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Task.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *taskTitleField;
@property (weak, nonatomic) IBOutlet UITextView *taskDescriptionField;
@property (weak, nonatomic) IBOutlet UILabel *taskDueDateField;
@property (nonatomic, strong) Task *taskItem;
@property (strong, nonatomic) id taskTitle;
@end
