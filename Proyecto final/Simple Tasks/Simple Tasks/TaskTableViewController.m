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
    NSMutableArray *tasks;
    DBManagement *services;
    TaskCell *cell;
}
- (void)configureView;
@end

@implementation TaskTableViewController

- (void) addTask: (id) task
{
    if(!tasks)
    {
        tasks = [[NSMutableArray alloc] init];
    }
    [tasks insertObject: task atIndex: 0];
    [self.tableView reloadData];
}

- (void) modTask: (id) task atIndex: (NSUInteger) arrayIndex
{
    if(!tasks)
    {
        tasks = [[NSMutableArray alloc] init];
    }
    [tasks replaceObjectAtIndex: arrayIndex withObject: task];
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

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    if([services loadTasks: [services searchTaskList: _taskListTitle]])
    {
        tasks = services.taskArray;
    }
    else
    {
        [tasks removeAllObjects];
    }
    [self.tableView reloadData];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    services = [DBManagement instance];
    if([services loadTasks: [services searchTaskList: _taskListTitle]])
    {
        tasks = services.taskArray;
    }
    else
    {
        [tasks removeAllObjects];
    }
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
    return tasks.count;
}


- (TaskCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:@"Task" forIndexPath:indexPath];
    NSDictionary *dic = [tasks objectAtIndex: indexPath.row];
    cell.cellTitle.text = [dic objectForKey: @"taskTitle"];
    
    /*-----------------------------------------------------------------------*/
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"dd/MM/yyyy"];
    NSString *tempString = [formatter stringFromDate: [dic objectForKey:@"taskDueDate"]];
    
    /*-----------------------------------------------------------------------*/
    
    cell.cellDueDate.text = tempString;
    cell.taskListTitle = _taskListTitle;
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]  initWithString: [dic objectForKey: @"taskTitle"]];
    NSMutableAttributedString *dueDate = [[NSMutableAttributedString alloc]  initWithString: tempString];
    
    if([cell readState])
    {
        [title addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleThick] range: NSMakeRange(0, [[dic objectForKey: @"taskTitle" ] length])];
        [dueDate addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleThick] range: NSMakeRange(0, [tempString length])];
    }
    else
    {
        [title addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleNone] range: NSMakeRange(0, [[dic objectForKey: @"taskTitle" ] length])];
        [dueDate addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleNone] range: NSMakeRange(0, [tempString length])];
    }
    
    [cell.cellTitle setAttributedText: title];
    [cell.cellDueDate setAttributedText: dueDate];
    
    [cell setState: [dic objectForKey:@"taskDone"]];
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
        [services deleteTask: [tasks objectAtIndex: indexPath.row] parentTaskList: _taskListTitle];
        [tasks removeObjectAtIndex:indexPath.row];
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
        cellIndex = indexPath.row;
        Task *element = [tasks objectAtIndex: cellIndex];
        [[segue destinationViewController] setTaskItem: element];
        [[segue destinationViewController] setDel: self];
        [[segue destinationViewController] setTaskListTitle: _taskListTitle];
    }
    else
    {
        if ([[segue identifier] isEqualToString:@"addSegue"]) {
            [[segue destinationViewController] setDelegate:self];
            [[segue destinationViewController] setTaskListTitle: _taskListTitle];
        }
    }
}

- (void) removeView: (int) index
{
    UIViewController * viewController = [self.navigationController.viewControllers objectAtIndex:1];
    if (index == 0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (index == 1)
    {
        [self.navigationController popToViewController: viewController animated:YES];
    }
}



- (IBAction)taskChecked: (id) sender
{
    TaskCell *taskCell = (TaskCell *) sender;
    //[sender setHidden: YES];
}
@end
















