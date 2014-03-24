//
//  DetailViewController.m
//  tareaPaises
//
//  Created by Gabriel Baca on 17/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "DetailViewController.h"
#import "Pais.h"

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
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];

    if (self.detailItem) {
        Pais *temp= (Pais *) self.detailItem;
        NSURL *urlImagen = [NSURL URLWithString: temp.imagen];
        NSData *dataImagen = [NSData dataWithContentsOfURL:urlImagen];
        UIImage *imagen = [UIImage imageWithData: dataImagen];
        NSNumber *numero = [NSNumber numberWithInteger:temp.numHabitantes];
        self.paisNombre.text = temp.nombre;
        self.paisCapital.text = temp.capital;
        self.paisHabitantes.text = [numberFormatter stringFromNumber: numero];
        self.paisImagen.image = imagen;
        //self.detailDescriptionLabel.text = [self.detailItem description];
        
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
