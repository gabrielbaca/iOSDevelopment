//
//  Contacto.m
//  ejercicioMasterDetail
//
//  Created by Alumno on 17/02/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import "Contacto.h"

@implementation Contacto

-(id) initWithNombre: (NSString *) nom oficina: (NSString *) ofic telefono: (NSInteger) tel
{
    self = [super init];
    if(self)
    {
        _nombre = nom;
        _oficina = ofic;
        _telefono = tel;
    }
    return self;
}
@end
