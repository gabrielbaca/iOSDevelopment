//
//  ViewController.m
//  actividadFecha
//
//  Created by Alumno on 05/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSDate *fechaMostrar;
NSDateFormatter *formato;
NSString *label1;
NSString *label2;
NSString *label3;

@implementation ViewController

-(void) updateView
{
    if(self.datePicker.selectedSegmentIndex == 0)
    {
        [formato setDateFormat:@"EEEE"];
        label1 = [formato stringFromDate:fechaMostrar];
        [formato setDateFormat:@"dd"];
        label2 = [formato stringFromDate:fechaMostrar];
        [formato setDateFormat:@"MMM',' yyyy"];
        label3 = [formato stringFromDate:fechaMostrar];
        
    }
    if(self.datePicker.selectedSegmentIndex == 1)
    {
        [formato setDateFormat:@"MMMM"];
        label1 = [formato stringFromDate:fechaMostrar];
        [formato setDateFormat:@"dd"];
        label2 = [formato stringFromDate:fechaMostrar];
        [formato setDateFormat:@"yyyy"];
        label3 = [formato stringFromDate:fechaMostrar];
    }
    self.weekDay.text = label1;
    self.monthDay.text = label2;
    self.monthYear.text = label3;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.datePicker.selectedSegmentIndex = (NSInteger) 0;
    fechaMostrar = [NSDate date];
    formato = [[NSDateFormatter alloc] init];
    [self updateView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dateSelector:(id)sender {
    [self updateView];
}

- (IBAction)dateForward:(id)sender {
    fechaMostrar = [fechaMostrar dateByAddingTimeInterval: 60 * 60 * 24 * 1];
    [self updateView];
}

- (IBAction)weekForward:(id)sender {
    fechaMostrar = [fechaMostrar dateByAddingTimeInterval: 60 * 60 * 24 * 7];
    [self updateView];
}

- (IBAction)dateBack:(id)sender {
    fechaMostrar = [fechaMostrar dateByAddingTimeInterval: -60 * 60 * 24 * 1];
    [self updateView];
}

- (IBAction)weekBack:(id)sender {
    fechaMostrar = [fechaMostrar dateByAddingTimeInterval: -60 * 60 * 24 * 7];
    [self updateView];
}
@end
