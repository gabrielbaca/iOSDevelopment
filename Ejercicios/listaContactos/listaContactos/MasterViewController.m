//
//  MasterViewController.m
//  listaContactos
//
//  Created by YolandaMartinez on 2/12/14.
//  Copyright (c) 2014 YolandaMartinez. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "Contacto.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    NSMutableArray *listaContactos;
}
@end

@implementation MasterViewController

- (void) agregaContacto: (NSString *) nombre withOficina: (NSString *) ofic withTelefono: (NSInteger) tel
{
    Contacto *tmp = [[Contacto alloc] initWithNombre:nombre oficina:ofic telefono:tel];
    [listaContactos addObject:tmp];
    [self.tableView reloadData];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
     */
    
    Contacto *cont1 = [[Contacto alloc] initWithNombre:@"Juan" oficina:@"Aulas 2-222" telefono:6457];
    Contacto *cont2 = [[Contacto alloc] initWithNombre:@"Rosy" oficina:@"Aulas 7-401" telefono:6482];
    listaContactos = [[NSMutableArray alloc] initWithObjects: cont1, cont2, nil];
    
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
    return listaContactos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Contacto *contacto = listaContactos[indexPath.row];
    cell.textLabel.text = [contacto nombre];
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
        Contacto *object = listaContactos[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
    else
    {
        if ([[segue identifier] isEqualToString:@"agrega"]) {
            [[segue destinationViewController] setDelegado:self];
        }
    }
}



- (void) quitaVista
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
