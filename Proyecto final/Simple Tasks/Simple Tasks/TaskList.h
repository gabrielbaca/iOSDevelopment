//
//  TaskList.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 4/21/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Task;

@interface TaskList : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *tasks;
@end

@interface TaskList (CoreDataGeneratedAccessors)

- (void)addTasksObject: (Task *) value;
- (void)removeTasksObject: (Task *) value;
- (void)addTasks: (NSSet *)values;
- (void)removeTasks: (NSSet *)values;

@end