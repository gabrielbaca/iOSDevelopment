//
//  Task.h
//  Simple Tasks
//
//  Created by Alejandro Baca on 3/24/14.
//  Copyright (c) 2014 Gabriel Baca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property (nonatomic, strong) NSString *taskTitle;
@property (nonatomic, strong) NSString *taskDescription;
@property (nonatomic, strong) NSDate *taskDueDate;

- (id) initWithTitle: (NSString *) title description: (NSString *) desc dueDate: (NSDate *) date;
- (NSString *) formatDate;
@end
