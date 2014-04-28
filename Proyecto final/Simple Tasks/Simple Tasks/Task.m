//
//  Task.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 4/21/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "Task.h"
#import "TaskList.h"


@implementation Task

@dynamic taskDone;
@dynamic taskDescription;
@dynamic taskDueDate;
@dynamic taskTitle;
@dynamic taskListRel;

- (id) initWithTitle: (NSString *) title description: (NSString *) desc dueDate: (NSDate *) taskDate
{
    self = [super init];
    if (self)
    {
        self.taskTitle = title;
        self.taskDescription = desc;
        self.taskDueDate = taskDate;
    }
    return self;
}

- (NSString *) formatDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"dd/MM/yyyy"];
    NSString *tempString = [formatter stringFromDate: self.taskDueDate];
    return tempString;
}

@end
