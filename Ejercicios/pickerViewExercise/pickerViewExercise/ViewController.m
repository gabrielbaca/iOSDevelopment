//
//  ViewController.m
//  pickerViewExercise
//
//  Created by Gabriel Baca on 08/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    ViewController *viewController;
    NSString *textComponent;
    NSString *numberComponent;
}
@end

@implementation ViewController

- (void) showText
{
    self.valueField.text = [textComponent stringByAppendingString: numberComponent];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _textArray = @[@"A", @"B", @"C", @"D", @"E", @"F"];
    _numberArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    textComponent = _textArray[0];
    numberComponent = _numberArray[0];
    //viewController = [[ViewController alloc] init];
    //[viewController showText];
    self.valueField.text = [textComponent stringByAppendingString: numberComponent];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-  (NSInteger) numberOfComponentsInPickerView: (UIPickerView *) pickerView
{
    return 2; 
}

-  (NSInteger) pickerView:(UIPickerView *) pickerView numberOfRowsInComponent: (NSInteger) component
{
    if(component == 0)
        return self.textArray.count;
    else
        return self.numberArray.count;
}

- (NSString * )pickerView: (UIPickerView *) pickerView titleForRow: (NSInteger)row forComponent:(NSInteger) component
{
    if (component == 0)
        return self.textArray[row];
    else
        return self.numberArray[row];
}


-  (void) pickerView: (UIPickerView *) pickerView didSelectRow: (NSInteger) row inComponent:(NSInteger) component
{
    textComponent = self.textArray[[pickerView selectedRowInComponent:0]];
    numberComponent = self.numberArray[[pickerView selectedRowInComponent:1]];
    self.valueField.text = [textComponent stringByAppendingString: numberComponent];
}


@end
