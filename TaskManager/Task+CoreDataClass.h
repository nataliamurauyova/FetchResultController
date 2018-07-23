//
//  Task+CoreDataClass.h
//  TaskManager
//
//  Created by Nataliya Murauyova on 7/20/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category;

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Task+CoreDataProperties.h"
