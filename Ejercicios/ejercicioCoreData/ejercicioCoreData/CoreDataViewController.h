//
//  CoreDataViewController.h
//  ejercicioCoreData
//
//  Created by Alumno on 19/03/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface CoreDataViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *clave;
@property (strong, nonatomic) IBOutlet UITextField *nombre;
@property (strong, nonatomic) IBOutlet UILabel *estatus;

- (IBAction)guardarDatos:(id)sender;
- (IBAction)buscarMateria:(id)sender;
@end
