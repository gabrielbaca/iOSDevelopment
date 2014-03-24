//
//  CoreDataViewController.m
//  ejercicioCoreData
//
//  Created by Alumno on 19/03/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import "CoreDataViewController.h"

@interface CoreDataViewController ()

@end

@implementation CoreDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)guardarDatos:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *nuevaMateria;
    nuevaMateria = [NSEntityDescription insertNewObjectForEntityForName:@"Materia" inManagedObjectContext:context];
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    if ([[self.clave.text stringByTrimmingCharactersInSet: set] length] != 0 && [[self.nombre.text stringByTrimmingCharactersInSet: set] length] != 0)
    {
        [nuevaMateria setValue: self.clave.text forKey:@"clave"];
        [nuevaMateria setValue: self.nombre.text forKey:@"nombre"];
        self.clave.text = @"";
        self.nombre.text = @"";
        [self.view endEditing: YES];
        NSError *error;
        [context save:&error];
        self.estatus.text = @"Materia guardada con exito";
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Favor de llenar todos los campos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (IBAction)buscarMateria:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Materia" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *pred =  [NSPredicate predicateWithFormat:@"(clave = %@)", self.clave.text];
    
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    NSError *error;
    
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        self.estatus.text = @"Clave no encontrada";
        self.clave.text = @"";
        self.nombre.text = @"";
    }
    else
    {
        matches = objects[0];
        self.clave.text = [matches valueForKey: @"clave"];
        self.nombre.text = [matches valueForKey: @"nombre"];
        self.estatus.text = @"Valor encontrado";
    }
    
    [self.view endEditing:YES];
}
@end












