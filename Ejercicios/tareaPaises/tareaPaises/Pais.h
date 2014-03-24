//
//  Pais.h
//  tareaPaises
//
//  Created by Gabriel Baca on 17/02/14.
//  Copyright (c) 2014 ITESM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pais : NSObject
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic, strong) NSString *imagen;
@property NSInteger numHabitantes;

-(id) initWithNombre: (NSString *) nom capital: (NSString *) cap imagen: (NSString *) url numHabitantes: (NSInteger) num;
@end
