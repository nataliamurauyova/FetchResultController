//
//  Task+CoreDataProperties.m
//  TaskManager
//
//  Created by Nataliya Murauyova on 7/20/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "Task+CoreDataProperties.h"

@implementation Task (CoreDataProperties)

+ (NSFetchRequest<Task *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Task"];
}

@dynamic name;
@dynamic timeStamp;
@dynamic isCompleted;
@dynamic category;

@end
