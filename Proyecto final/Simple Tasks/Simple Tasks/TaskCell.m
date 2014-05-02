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
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]  initWithString: self.cellTitle.text];
    NSMutableAttributedString *dueDate = [[NSMutableAttributedString alloc]  initWithString: self.cellDueDate.text];
    if(!checked)
    {
        [self.cellDone setImage:[UIImage imageNamed:@"checkbox-checked.png"] forState:UIControlStateNormal];
        checked = YES;
        [title addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleThick] range:NSMakeRange(0, [self.cellTitle.text length])];
        
        [dueDate addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleThick] range:NSMakeRange(0, [self.cellDueDate.text length])];
        
        [self.cellTitle setAttributedText: title];
        [self.cellDueDate setAttributedText: dueDate];
    }
    else if(checked)
    {
        [self.cellDone setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
        checked = NO;
        
        [title addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt: NSUnderlineStyleNone] range:NSMakeRange(0, [self.cellTitle.text length])];
        
        [dueDate addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleNone] range:NSMakeRange(0, [self.cellDueDate.text length])];
        
        [self.cellTitle setAttributedText: title];
        [self.cellDueDate setAttributedText: dueDate];
    }
    [self modifyState];
}

-(BOOL) readState
{
    return checked;
}

- (void) setState: (BOOL) state
{
    checked = state;
}

- (void) modifyState
{
    NSDictionary *currentTask = [[NSDictionary alloc] initWithObjectsAndKeys: self.cellTitle, @"taskTitle", self.cellDueDate, @"taskDueDate", nil];
    [services setTaskCompleted: currentTask taskDone: checked parentTaskList: self.taskListTitle];
}
@end








