//
//  DetailViewController.m
//  examenParcial1
//
//  Created by Alumno on 19/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import "DetailViewController.h"

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
//        self.detailDescriptionLabel.text = [self.detailItem description];
        self.detailDescriptionLabel.text = @"Hola!!!";
        if([self.detailItem isEqualToString:@"Rojo"])
        {
            [self.detailDescriptionLabel setTextColor:[UIColor redColor] ];
        }
        if([self.detailItem isEqualToString:@"Azul"])
        {
           [self.detailDescriptionLabel setTextColor:[UIColor blueColor] ];
        }
        if([self.detailItem isEqualToString:@"Verde"])
        {
            [self.detailDescriptionLabel setTextColor:[UIColor greenColor] ];
        }
        if([self.detailItem isEqualToString:@"Morado"])
        {
            [self.detailDescriptionLabel setTextColor:[UIColor purpleColor] ];
        }
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.result.text = [NSString stringWithFormat:@"%i", 0];
    self.bigResult.text = [NSString stringWithFormat:@"%i", 0];
    [self.bigResult setBackgroundColor: [UIColor yellowColor]];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)equalButton:(id)sender {
    
    if([self.textField1.text isEqualToString:@""] || [self.textField2.text isEqualToString:@""])
    {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Ambos datos deben tener valor" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
    }
    else
    {
        NSInteger temp1 = [self.textField1.text integerValue];
        NSInteger temp2 = [self.textField2.text integerValue];
        NSInteger result = temp1 * temp2;
        self.result.text = [NSString stringWithFormat: @"%i", (int) result];
        self.bigResult.text =[NSString stringWithFormat: @"%i", (int) result];
    }
}
-(IBAction)quitaTeclado:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)mostrarOcultar:(id)sender {
    if(self.mostrarOcultarOutlet.selectedSegmentIndex == 0)
    {
        self.resultView.hidden = false;
    }
    else if(self.mostrarOcultarOutlet.selectedSegmentIndex == 1)
    {
        self.resultView.hidden = true;
    }
}

- (IBAction)switchAction:(id)sender {
    if([self.bigResult.backgroundColor isEqual:[UIColor cyanColor]])
    {
        [self.bigResult setBackgroundColor: [UIColor yellowColor]];
    }
    else if ([self.bigResult.backgroundColor isEqual:[UIColor yellowColor]])
    {
        [self.bigResult setBackgroundColor: [UIColor cyanColor]];
    }
}

- (IBAction)yesNoButton:(id)sender {
    //float initPosition = self.bigResult.frame.origin.x;
    
    if([self.yesNoOutlet.currentTitle isEqualToString:@"Si"])
    {
        [self.yesNoOutlet setTitle:@"No" forState:UIControlStateNormal];
        self.bigResult.frame = CGRectMake(self.bigResult.frame.origin.x + 70, self.bigResult.frame.origin.y, self.bigResult.frame.size.width, self.bigResult.frame.size.height);
    }
    else if([self.yesNoOutlet.currentTitle isEqualToString:@"No"])
    {
        [self.yesNoOutlet setTitle:@"Si" forState:UIControlStateNormal];
        self.bigResult.frame = CGRectMake(self.bigResult.frame.origin.x - 70, self.bigResult.frame.origin.y, self.bigResult.frame.size.width, self.bigResult.frame.size.height);
    }
    
}
@end
