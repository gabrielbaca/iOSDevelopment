//
//  DetailViewController.m
//  listaContactos
//
//  Created by YolandaMartinez on 2/12/14.
//  Copyright (c) 2014 YolandaMartinez. All rights reserved.
//

#import "DetailViewController.h"
#import "Contacto.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        Contacto *contacto = (Contacto *) self.detailItem;
        self.nombre.text = contacto.nombre;
        self.oficina.text = contacto.oficina;
        self.telefono.text = [NSString stringWithFormat: @"%ld", (long) contacto.telefono];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
