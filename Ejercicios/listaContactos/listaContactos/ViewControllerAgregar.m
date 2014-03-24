//
//  ViewControllerAgregar.m
//  listaContactos
//
//  Created by Gabriel Baca on 24/02/14.
//  Copyright (c) 2014 YolandaMartinez. All rights reserved.
//

#import "ViewControllerAgregar.h"

@interface ViewControllerAgregar ()

@end

@implementation ViewControllerAgregar

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

- (IBAction)oprimioDone:(id)sender
{
    if (![self.outletNombre.text isEqualToString:@""])
    {
        [self.delegado agregaContacto: self.outletNombre.text withOficina: self.outletOficina.text withTelefono: self.outletTelefono.text.integerValue];
    }
    [self.delegado quitaVista];
}

@end
