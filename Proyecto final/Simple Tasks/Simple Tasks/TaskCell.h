//
//  TaskCell.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCell : UITableViewCell
{
    bool checked;
}
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellDueDate;
@property (weak, nonatomic) IBOutlet UIButton *cellDone;
- (IBAction)cellActionDone:(id)sender;
@end
