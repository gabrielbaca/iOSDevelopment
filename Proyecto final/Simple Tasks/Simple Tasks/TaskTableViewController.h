//
//  TaskTableViewController.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddTaskViewController.h"
#import "DetailViewController.h"
#import "DBManagement.h"

NSUInteger cellIndex;

@interface TaskTableViewController : UITableViewController <AddTaskProtocol>
@property (strong, nonatomic) id taskListTitle;
@end
