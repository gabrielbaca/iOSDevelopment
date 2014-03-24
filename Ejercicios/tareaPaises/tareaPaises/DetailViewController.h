//
//  DetailViewController.h
//  tareaPaises
//
//  Created by Gabriel Baca on 17/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *paisNombre;
@property (weak, nonatomic) IBOutlet UILabel *paisCapital;
@property (weak, nonatomic) IBOutlet UILabel *paisHabitantes;
@property (weak, nonatomic) IBOutlet UIImageView *paisImagen;

@end
