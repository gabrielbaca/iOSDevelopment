//
//  CustomCell.m
//  Tareas
//
//  Created by Alejandro Baca on 3/10/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkboxButton:(id)sender {
    [sender setSelected:![sender isSelected]];
}
@end
