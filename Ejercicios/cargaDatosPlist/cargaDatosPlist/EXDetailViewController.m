//
//  EXDetailViewController.m
//  cargaDatosPlist
//
//  Created by Alumno on 26/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import "EXDetailViewController.h"

@interface EXDetailViewController ()
- (void)configureView;
@end

@implementation EXDetailViewController

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
        NSDictionary *dict = (NSDictionary *) self.detailItem;
        self.tipoIpod.text = [dict objectForKey:@"tipo"];
        self.capacidadIpod.text = [dict objectForKey:@"capacidad"];
        self.precioIpod.text = [[dict objectForKey:@"precio"] stringValue];
        self.imagenIpod.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[NSURL URLWithString:[dict objectForKey:@"urlFoto"]]]];
        self.detailDescriptionLabel.text = [self.detailItem description];
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
