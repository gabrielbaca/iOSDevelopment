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

// Método para insertar datos a la base de datos
- (void) addTaskList: (id) taskListInfo tasks: (NSArray *) myTasks;
//- (void)insertarMateria:(id) datosMateria libros: (NSArray *) misLibros;
- (void) addTask: (id) taskInfo taskList: (TaskList *) newTaskList;
//- (void)insertarLibro:(id) datosLibro materia: (Materia *) nuevaMateria;

// Method to obtain info from DB
- (void) loadTaskLists;
- (void) loadTasks;
//- (void)cargarMaterias;
//- (void)cargarLibros;

// Método para  obtener datos de un libro
//-(id) buscarLibro: (NSString *) isbn;
//-(NSArray*) buscarLibrosMateria: (NSString *) clave;

- (void) modifyTask: (NSString *) title dueDate: (NSDate *) dueDate;
- (void) modifyTaskList: (NSString *) title;

@end