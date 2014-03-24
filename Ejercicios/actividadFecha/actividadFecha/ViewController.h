//
//  ViewController.h
//  actividadFecha
//
//  Created by Alumno on 05/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *weekDay;
@property (weak, nonatomic) IBOutlet UILabel *monthDay;
@property (weak, nonatomic) IBOutlet UILabel *monthYear;
@property (weak, nonatomic) IBOutlet UISegmentedControl *datePicker;

- (IBAction)dateSelector:(id)sender;
- (IBAction)dateForward:(id)sender;
- (IBAction)weekForward:(id)sender;
- (IBAction)dateBack:(id)sender;
- (IBAction)weekBack:(id)sender;

@end
