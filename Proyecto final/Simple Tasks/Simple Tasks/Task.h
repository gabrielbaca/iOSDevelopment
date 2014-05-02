//
//  Task.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 4/21/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TaskList.h"

@class TaskList;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSNumber * taskDone;
@property (nonatomic, retain) NSString * taskDescription;
@property (nonatomic, retain) NSDate * taskDueDate;
@property (nonatomic, retain) NSString * taskTitle;
@property (nonatomic, retain) TaskList *taskListRel;

- (id) initWithTitle: (NSString *) title description: (NSString *) desc dueDate: (NSDate *) date;
- (NSString *) formatDate;
@end

@interface Task (CoreDataGeneratedAccessors)

- (void)addTaskListRelObject: (TaskList *) value; // NSManagedObject
- (void)removeTaskListRelObject: (TaskList *) value;
- (void)addTaskListRel:(NSSet *)values;
- (void)removeTaskListRel:(NSSet *)values;

@end
