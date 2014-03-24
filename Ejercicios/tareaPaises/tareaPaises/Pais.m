//
//  Pais.m
//  tareaPaises
//
//  Created by Gabriel Baca on 17/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import "Pais.h"

@implementation Pais
-(id) initWithNombre: (NSString *) nom capital: (NSString *) cap imagen: (NSString *) url numHabitantes:(NSInteger) num
{
    self = [super init];
    if(self)
    {
        _nombre = nom;
        _capital = cap;
        _imagen = url;
        _numHabitantes = num;
    }
    return self;
}
@end
