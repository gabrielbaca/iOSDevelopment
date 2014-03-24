//
//  Contacto.h
//  ejercicioMasterDetail
//
//  Created by Alumno on 17/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contacto : NSObject
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *oficina;
@property NSInteger telefono;

-(id) initWithNombre: (NSString *) nom oficina: (NSString *) ofic telefono: (NSInteger) tel;
@end
