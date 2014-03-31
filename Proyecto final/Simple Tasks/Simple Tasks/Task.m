//
//  Task.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "Task.h"

@implementation Task
- (id) initWithTitle: (NSString *) title description: (NSString *) desc dueDate: (NSDate *) taskDate
{
    self = [super init];
    if (self)
    {
        _taskTitle = title;
        _taskDescription = desc;
        _taskDueDate = taskDate;
    }
    return self;
}
- (NSString *) formatDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"dd/MM/yyyy"];
    NSString *tempString = [formatter stringFromDate: _taskDueDate];
    return tempString;
}
@end
