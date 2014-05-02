//
//  DBManagement.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 4/22/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "DBManagement.h"

@implementation DBManagement

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSMutableArray *) convierteDiccionario: (NSMutableArray  *) arregloDict
{
    NSMutableArray *arreglo = [[NSMutableArray alloc] init];
    for (int i = 0; i < [arregloDict count]; i++)
    {
        NSArray *keys = [[[[arregloDict objectAtIndex:i] entity] attributesByName] allKeys];
        NSDictionary *dict = [[arregloDict objectAtIndex:i] dictionaryWithValuesForKeys:keys];
        [arreglo addObject:dict];
    }
    return arreglo;
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Simple_Tasks" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Simple_Tasks.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Singleton
- (id) init
{
    if ((self = [super init]))
    {
        // Se inicializan variables globales
        [self setTaskArray: [[NSMutableArray alloc] init]];
        [self setTaskListArray: [[NSMutableArray alloc] init]];
    }
    return self;
}

+ (DBManagement *) instance
{
    // Crea la instancia persistente.
    static DBManagement *_default = nil;
    
    // Pequeña optimización para evitar perder tiempo después que el
    // singleton se ha inicializado.
    if (_default != nil)
    {
        return _default;
    }
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
    // Se aloja una sola vez con la rutina de "gran despacho central" (GCD de las siglas en inglés)
    // Realiza un manejo seguro de "hilos" (threads)
    static dispatch_once_t safer;
    dispatch_once(&safer, ^(void)
                  {
                      _default = [[DBManagement alloc] init];
                  });
#else
    // Se aloja una sola vez, usando la estrategia anterior, es más lento
    // Realiza un manejo seguro de "hilos" (threads)
    @synchronized([DBManagement class])
    {
        // La instrucción "synchronized" se asegurará
        // que solo un hilo a la vez pueda accesar este punto
        if (_default == nil)
        {
            _default = [[DBManagement alloc] init];
        }
    }
#endif
    return _default;
}
// Materia - Task List
// Libro - Task

#pragma mark - DB API

// Método para insertar un registro de lista de tareas en la base de datos
- (void) addTaskList: (id) taskListInfo tasks: (NSArray *) myTasks
{
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSDictionary *myTaskList = (NSDictionary *) taskListInfo;
    
    TaskList *newTaskList = [NSEntityDescription insertNewObjectForEntityForName:@"TaskList"inManagedObjectContext: context];
    
    newTaskList.title = [myTaskList objectForKey: @"title"];
    for (int i = 0; i < myTasks.count; i++)
    {
        [newTaskList addTasksObject: myTasks[i]];
    }
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
}

// Método para insertar un registro de libro en la base de datos
- (void) addTask: (id) taskInfo taskList: (TaskList *) newTaskList
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSDictionary *myTask = (NSDictionary *) taskInfo;
    
    Task *newTask = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext: context];
    
    newTask.taskTitle = [myTask objectForKey:@"taskTitle"];
    newTask.taskDescription = [myTask objectForKey:@"taskDescription"];
    newTask.taskDueDate = [myTask objectForKey:@"taskDueDate"];
    newTask.taskDone = [myTask objectForKey:@"taskDone"];
    
    if (newTaskList)
    {
        newTask.taskListRel = newTaskList;
        //[newTask addTaskListRelObject: newTaskList];
    }
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
}

- (void) clearTaskArray
{
    [self.taskArray removeAllObjects];
}

// Método para cargar las materias de la base de datos
- (void)loadTaskLists //cargarMaterias
{
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"TaskList" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    // Se especifica el orden en que se quiere que ordene los registros
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    [request setSortDescriptors:[[NSArray alloc] initWithObjects: sortDescriptor, nil]];
    NSError *error;
    NSArray *data;
    data = (NSMutableArray*) [context executeFetchRequest:request error:&error];
    
    if ([data count] == 0)
    {
        NSLog (@"No existen listas de tareas que cargar");
    }
    else
    {
        [self setTaskListArray: [self convierteDiccionario: (NSMutableArray *) data]];
    }
}

// Método para cargar los libos de la base de datos
- (BOOL) loadTasks: (TaskList *) taskList //cargarLibros
{
    NSManagedObjectContext *context = self.managedObjectContext;
    
    //NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Task"];
    //[request setEntity:entityDescription];
    
    NSString *searchValue = [NSString stringWithFormat:@"*%@*", [taskList valueForKey:@"title"]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"(ANY taskListRel.title like %@)", searchValue];
   [request setPredicate: predicate];
    
    
    // Se especifica el orden en que se quiere que ordene los registros
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"taskDueDate" ascending:YES];
    [request setSortDescriptors: [[NSArray alloc] initWithObjects: sortDescriptor, nil]];
    
    NSError *error;
    NSArray *data;
    
    data = (NSMutableArray *) [context executeFetchRequest:request error:&error];
    if ([data count] == 0)
    {
        NSLog (@"No existen tareas que cargar");
        return false;
    }
    else
    {
        NSMutableArray *tempTaskArray = [self convierteDiccionario: (NSMutableArray *) data];
        [self setTaskArray: tempTaskArray];
        return true;
    }
}

- (void) modifyTask: (NSString *) title dueDate: (NSDate *) dueDate newTitle: (NSString *) newTitle newDueDate: (NSDate *) newDueDate newDescription: (NSString *) newDescription
{
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"(taskTitle == %@)", title, @"(taskDueDate == %@)", dueDate];
    [request setPredicate: predicate];
    
    NSError *error;
    //NSArray *data;
    
    //data = (NSMutableArray *) [context executeFetchRequest: request error: &error];
    
    Task *aTask = [[context executeFetchRequest: request error: &error] objectAtIndex: 0];
    aTask.taskTitle = newTitle;
    aTask.taskDescription = newDescription;
    aTask.taskDueDate = newDueDate;
    
    [self.managedObjectContext save: &error];
    
}

- (void) modifyTaskList:(NSString *) title newTitle: (NSString *) newTitle
{
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"TaskList" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"(title == %@)", title];
    [request setPredicate: predicate];
    
    NSError *error;
    //NSArray *data;
    
    //data = (NSMutableArray *) [context executeFetchRequest: request error: &error];
    
    TaskList *aTaskList = [[context executeFetchRequest: request error: &error] objectAtIndex: 0];
    aTaskList.title = newTitle;
    
    [self.managedObjectContext save: &error];
    
}

- (id) searchTaskList: (NSString *) title
{
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"TaskList" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"(title == %@)", title];
    [request setPredicate: predicate];
    
    NSError *error;
    //NSArray *data;
    
    //data = (NSMutableArray *) [context executeFetchRequest: request error: &error];
    
    TaskList *aTaskList = [[context executeFetchRequest: request error: &error] objectAtIndex: 0];

    return aTaskList;
}



@end
