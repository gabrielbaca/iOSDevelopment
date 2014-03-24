//
//  ViewControllerAgregar.h
//  listaContactos
//
//  Created by Gabriel Baca on 24/02/14.
//  Copyright (c) 2014 YolandaMartinez. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ProtocoloAgregarContacto <NSObject>

- (void) agregaContacto: (NSString *) nombre withOficina: (NSString *) ofic withTelefono: (NSInteger) tel;
- (void) quitaVista;

@end
@interface ViewControllerAgregar : UIViewController
@property (nonatomic, strong) id <ProtocoloAgregarContacto> delegado;
@property (weak, nonatomic) IBOutlet UITextField *outletNombre;
@property (weak, nonatomic) IBOutlet UITextField *outletOficina;
@property (weak, nonatomic) IBOutlet UITextField *outletTelefono;
- (IBAction)oprimioDone:(id)sender;

@end
