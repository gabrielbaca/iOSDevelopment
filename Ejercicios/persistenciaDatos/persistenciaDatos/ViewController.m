//
//  ViewController.m
//  persistenciaDatos
//
//  Created by Alejandro Baca on 3/18/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath: filePath])
    {NSArray *array = [ [NSArray alloc] initWithContentsOfFile: filePath];self.dato1.text = [array objectAtIndex: 0];self.dato2.text = [array objectAtIndex: 1];self.dato3.text = [array objectAtIndex: 2];self.dato4.text = [array objectAtIndex: 3];
    }
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter  defaultCenter] addObserver: self selector: @selector(aplicacionTerminara:) name: UIApplicationDidEnterBackgroundNotificationobject: app];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *) dataFilePath { NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES); NSString *documentsDirectory = [paths objectAtIndex: 0]; return [documentsDirectory stringByAppendingPathComponent: @"archivoDatos.plist"];
}

- (void) aplicacionTerminara: (NSNotification *) notification {
	NSMutableArray *array = [[NSMutableArray alloc] init];
	[array addObject: self.dato1.text];
	[array addObject: self.dato2.text];
	[array addObject: self.dato3.text];
	[array addObject: self.dato4.text];
	[array writeToFile: [self dataFilePath] atomically: YES];
}

@end
