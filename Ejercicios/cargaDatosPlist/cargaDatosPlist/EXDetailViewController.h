//
//  EXDetailViewController.h
//  cargaDatosPlist
//
//  Created by Alumno on 26/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EXDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *tipoIpod;
@property (strong, nonatomic) IBOutlet UILabel *capacidadIpod;
@property (strong, nonatomic) IBOutlet UILabel *precioIpod;
@property (strong, nonatomic) IBOutlet UIImageView *imagenIpod;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
