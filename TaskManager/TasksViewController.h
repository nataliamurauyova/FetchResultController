//
//  TasksViewController.h
//  TaskManager
//
//  Created by Nataliya Murauyova on 7/20/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface TasksViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (strong,nonatomic) NSFetchedResultsController *taskResults;

@end
