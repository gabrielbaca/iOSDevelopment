//
//  DBManagement.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 4/22/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TaskList.h"
#import "Task.h"

@interface DBManagement : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) NSMutableArray *taskListArray;
@property (strong, nonatomic) NSMutableArray *taskArray;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (id) init;

#pragma mark - Class methods

// Singleton method access from anywhere
+ (DBManagement *) instance;

#pragma mark - Instance methods

// Task
- (void) addTask: (id) taskInfo taskList: (TaskList *) newTaskList;
- (void) clearTaskArray;
- (BOOL) loadTasks: (TaskList *) taskList;
- (void) modifyTask: (id) currentTask newTask: (id) modifiedTask taskListTitle: (NSString *) title;
- (void) deleteTask:(id) taskToBeDeleted parentTaskList: (NSString *) taskListTitle;
- (void) setTaskCompleted: (id) currentTask taskDone: (BOOL) taskCompletion parentTaskList: (NSString *) pTaskList;
- (int) countTasks: (NSString *) taskListTitle;

// Task List
- (void) addTaskList: (id) taskListInfo tasks: (NSArray *) myTasks;
- (void) loadTaskLists;
- (void) modifyTaskList:(NSString *) title newTitle: (NSString *) newTitle;
- (id) searchTaskList: (NSString *) title;
- (void) deleteTaskList: (NSString *) taskListToBeDeleted;

@end
