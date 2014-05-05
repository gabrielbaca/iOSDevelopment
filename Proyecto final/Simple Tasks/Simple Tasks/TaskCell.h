//
//  TaskCell.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManagement.h"

@interface TaskCell : UITableViewCell
{
    //BOOL checked;
    DBManagement *services;
}
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellDueDate;
@property (weak, nonatomic) IBOutlet UIButton *cellDone;
@property (strong, nonatomic) id taskListTitle;
@property (strong, nonatomic) NSNumber *checked;
- (IBAction)cellActionDone:(id)sender;

- (NSNumber *) readState;
- (void) setState: (NSNumber *) state;
- (void) modifyState;
@end
