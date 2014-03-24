//
//  CustomCell.h
//  Tareas
//
//  Created by Alejandro Baca on 3/10/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *checkboxButton;
- (IBAction)checkboxButton:(id)sender;


@end
