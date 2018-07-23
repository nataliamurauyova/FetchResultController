//
//  Task+CoreDataProperties.h
//  TaskManager
//
//  Created by Nataliya Murauyova on 7/20/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import "Task+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Task (CoreDataProperties)

+ (NSFetchRequest<Task *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *timeStamp;
@property (nonatomic) BOOL isCompleted;
@property (nullable, nonatomic, retain) Category *category;

@end

NS_ASSUME_NONNULL_END
