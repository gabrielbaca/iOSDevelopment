//
//  CustomCell.h
//  celdasMedida
//
//  Created by Gabriel Baca on 08/03/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UITextField *cellType;
@property (weak, nonatomic) IBOutlet UITextField *cellCapacity;
@property (weak, nonatomic) IBOutlet UITextField *cellPrice;

@end
