//
//  TaskListTableViewController.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "TaskListTableViewController.h"
#import "TaskTableViewController.h"
@interface TaskListTableViewController ()
{
    NSMutableArray *taskListsArray;
    DBManagement *services;
}
@end

@implementation TaskListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidAppear: (BOOL) animated
{
    [super viewDidAppear: animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    services = [DBManagement instance];
    taskListsArray = services.taskListArray;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger) buttonIndex {
    if (buttonIndex == 1) {
        NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:[alertView textFieldAtIndex:0].text, @"title" , nil];
        [services addTaskList: dic tasks: nil];
        [taskListsArray insertObject: dic atIndex:0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

-(void) insertNewObject: (id) sender
{
    if (!taskListsArray) {
        taskListsArray = [[NSMutableArray alloc] init];
    }
    UIAlertView *titlePrompt = [[UIAlertView alloc] initWithTitle:@"Task list title" message:@"Insert task list title" delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel",nil) otherButtonTitles:NSLocalizedString(@"OK",nil), nil];
    [titlePrompt setAlertViewStyle: UIAlertViewStylePlainTextInput];
    [titlePrompt show];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return taskListsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *dic = [taskListsArray objectAtIndex: indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
    int nTasks = [services countTasks: [dic objectForKey:@"title"]];
    if (nTasks != 1) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d tasks", [services countTasks: [dic objectForKey:@"title"]]];
    }
    else
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d task", [services countTasks: [dic objectForKey:@"title"]]];
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}




// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSString *taskListDeletion = [[taskListsArray objectAtIndex: indexPath.row] valueForKey:@"title"];
        [services deleteTaskList: taskListDeletion];
        [taskListsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"taskSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TaskList *taskList = [taskListsArray objectAtIndex:indexPath.row];
        [[segue destinationViewController] setTaskListTitle: [taskList valueForKey:@"title"]];
    }
}

@end
