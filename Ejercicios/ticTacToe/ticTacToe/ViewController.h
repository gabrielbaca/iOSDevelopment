//
//  ViewController.h
//  ticTacToe
//
//  Created by Alumno on 29/01/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *img1;
@property (weak, nonatomic) IBOutlet UIButton *img2;
@property (weak, nonatomic) IBOutlet UIButton *img3;
@property (weak, nonatomic) IBOutlet UIButton *img4;
@property (weak, nonatomic) IBOutlet UIButton *img5;
@property (weak, nonatomic) IBOutlet UIButton *img6;
@property (weak, nonatomic) IBOutlet UIButton *img7;
@property (weak, nonatomic) IBOutlet UIButton *img8;
@property (weak, nonatomic) IBOutlet UIButton *img9;
@property (weak, nonatomic) IBOutlet UILabel *jugador;

- (IBAction)but1:(id)sender;
- (IBAction)but2:(id)sender;
- (IBAction)but3:(id)sender;
- (IBAction)but4:(id)sender;
- (IBAction)but5:(id)sender;
- (IBAction)but6:(id)sender;
- (IBAction)but7:(id)sender;
- (IBAction)but8:(id)sender;
- (IBAction)but9:(id)sender;
- (IBAction)resetButton:(id)sender;

@end
