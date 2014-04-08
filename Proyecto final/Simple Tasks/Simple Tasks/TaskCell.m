//
//  TaskCell.m
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)cellActionDone:(id)sender {
    if(!checked)
    {
        [self.cellDone setImage:[UIImage imageNamed:@"checkbox-checked.png"] forState:UIControlStateNormal];
        checked = YES;
    }
    else if(checked)
    {
        [self.cellDone setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        checked = NO;
    }
}
@end
