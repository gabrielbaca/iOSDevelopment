//
//  DetailViewController.h
//  examenParcial1
//
//  Created by Alumno on 19/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UIView *resultView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mostrarOcultarOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;
@property (weak, nonatomic) IBOutlet UIButton *yesNoOutlet;
@property (weak, nonatomic) IBOutlet UILabel *bigResult;

- (IBAction)equalButton:(id)sender;
- (IBAction)quitaTeclado:(id)sender;
- (IBAction)mostrarOcultar:(id)sender;
- (IBAction)switchAction:(id)sender;
- (IBAction)yesNoButton:(id)sender;

@end
