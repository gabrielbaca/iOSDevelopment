//
//  DetailViewController.h
//  ejercicioMasterDetail
//
//  Created by Alumno on 17/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *contactName;
@property (weak, nonatomic) IBOutlet UILabel *contactOffice;
@property (weak, nonatomic) IBOutlet UILabel *contactPhone;
@end
