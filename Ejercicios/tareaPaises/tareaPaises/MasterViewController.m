//
//  MasterViewController.m
//  tareaPaises
//
//  Created by Gabriel Baca on 17/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "MasterViewController.h"
#import "Pais.h"
#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    NSArray *arreglo;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Pais *mexico = [[Pais alloc] initWithNombre:@"México" capital:@"Ciudad de México" imagen:@"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1600px-Flag_of_Mexico.svg.png" numHabitantes:11942600];
    Pais *rusia = [[Pais alloc] initWithNombre:@"Rusia" capital:@"Moscú" imagen:@"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/1599px-Flag_of_Russia.svg.png" numHabitantes:142905200];
    Pais *italia = [[Pais alloc] initWithNombre:@"Italia" capital:@"Roma" imagen:@"http://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/1599px-Flag_of_Italy.svg.png" numHabitantes:59433744];
    Pais *espana = [[Pais alloc] initWithNombre:@"España" capital:@"Madrid" imagen:@"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/1500px-Flag_of_Spain.svg.png" numHabitantes:47129783];
    arreglo = [[NSArray alloc] initWithObjects:mexico, rusia, italia, espana, nil];
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arreglo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Pais *object = arreglo[indexPath.row];
    cell.textLabel.text = object.nombre;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Pais *object = arreglo[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
