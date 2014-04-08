		//
//  TaskTableViewController.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "TaskTableViewController.h"
#import "Task.h"
#import "TaskCell.h"

@interface TaskTableViewController ()
{
    NSMutableArray *_tasks;
}
- (void)configureView;
@end

@implementation TaskTableViewController

- (void) addTask: (id) task
{
    if(!_tasks)
    {
        _tasks = [[NSMutableArray alloc] init];
    }
    [_tasks insertObject: task atIndex: 0];
    [self.tableView reloadData];
}

- (void) modTask: (id) task atIndex: (NSUInteger) arrayIndex
{
    if(!_tasks)
    {
        _tasks = [[NSMutableArray alloc] init];
    }
    [_tasks replaceObjectAtIndex: arrayIndex withObject: task];
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.taskListTitle) {
        self.navigationItem.title = self.taskListTitle;
    }
}
- (void)setTaskListTitle:(id)newDetailItem
{
    if (_taskListTitle != newDetailItem) {
        _taskListTitle = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    Task *task1 = [[Task alloc] initWithTitle:@"Test" description:@"Desc test" dueDate: [NSDate date]];
     _tasks = [[NSMutableArray alloc] initWithObjects: task1, nil];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return _tasks.count;
}


- (TaskCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Task" forIndexPath:indexPath];
    Task *tempTask = _tasks[indexPath.row];
    //tempTask.taskDueDate = [NSDate date];
    cell.cellTitle.text = tempTask.taskTitle;
    cell.cellDueDate.text = [tempTask formatDate];
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
        [_tasks removeObjectAtIndex:indexPath.row];
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Task *element = _tasks[indexPath.row];
        cellIndex = indexPath.row;
        [[segue destinationViewController] setTaskItem: element];
        [[segue destinationViewController] setDel: self];
    }
    else
    {
        if ([[segue identifier] isEqualToString:@"addSegue"]) {
            [[segue destinationViewController] setDelegate:self];
        }
    }
}

- (void) removeView: (int) index
{
    UIViewController * viewController = [self.navigationController.viewControllers objectAtIndex:1];
    if (index == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (index == 1)
    {
        [self.navigationController popToViewController: viewController animated:YES];
    }
}



@end
