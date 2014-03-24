//
//  ViewController2.m
//  celdasEstaticas
//
//  Created by Gabriel Baca on 08/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
- (void) configureView;
@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDetailItem:(id) newDetailItem
{
    if (_masterAttribute != newDetailItem) {
        _masterAttribute = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
   if (self.masterAttribute) {
        self.labelOutlet2.text = (NSString *) self.masterAttribute;
   }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
