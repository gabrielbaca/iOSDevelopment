//
//  DetailViewController.m
//  ejercicioMasterDetail
//
//  Created by Alumno on 17/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
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
    Contacto *temp;
    if (self.detailItem) {
        temp = (Contacto *) self.detailItem;
        self.contactName.text = [temp.nombre description];
        self.contactOffice.text = [temp.oficina description];
        self.contactPhone.text = [NSString stringWithFormat: @"%i", temp.telefono];
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
