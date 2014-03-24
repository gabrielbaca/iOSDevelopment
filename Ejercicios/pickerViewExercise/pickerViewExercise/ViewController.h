//
//  ViewController.h
//  pickerViewExercise
//
//  Created by Gabriel Baca on 08/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *textPickerView;
@property (weak, nonatomic) IBOutlet UITextField *valueField;

@property (strong, nonatomic) NSArray *textArray;
@property (strong, nonatomic) NSArray *numberArray;

#pragma mark - Delegate
- (NSString * )pickerView: (UIPickerView *) pickerView titleForRow: (NSInteger)row forComponent:(NSInteger) component;
//-  (UIView *) pickerView: (UIPickerView *) pickerView viewForRow: (NSInteger)row forComponent:(NSInteger) component reusingView: (UIView *) view;

#pragma mark - Data Source
- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *) pickerView;
- (NSInteger) pickerView:(UIPickerView *) pickerView numberOfRowsInComponent: (NSInteger) component;

#pragma mark - Custom methods
- (void) pickerView: (UIPickerView *) pickerView didSelectRow: (NSInteger) row inComponent:(NSInteger) component;
- (void) showText;

@end
