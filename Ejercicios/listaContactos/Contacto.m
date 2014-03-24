//
//  Contacto.m
//  listaContactos
//
//  Created by YolandaMartinez on 2/12/14.
//  Copyright (c) 2014 YolandaMartinez. All rights reserved.
//

#import "Contacto.h"

@implementation Contacto

- (id) initWithNombre: (NSString *) nom oficina: (NSString *) ofic telefono: (NSInteger) tel
{
    self = [super init];
    if (self)
    {
        _nombre = nom;
        _oficina = ofic;
        _telefono = tel;
    }
    return self;
}

@end
