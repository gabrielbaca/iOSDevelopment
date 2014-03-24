//
//  DetailViewController.h
//  listaContactos
//
//  Created by YolandaMartinez on 2/12/14.
//  Copyright (c) 2014 YolandaMartinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UILabel *oficina;
@property (weak, nonatomic) IBOutlet UILabel *telefono;

@end
