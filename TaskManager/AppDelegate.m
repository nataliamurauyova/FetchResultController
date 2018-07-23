//
//  AppDelegate.m
//  TaskManager
//
//  Created by Nataliya Murauyova on 7/20/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//

#import "AppDelegate.h"
#import "TasksViewController.h"

@interface AppDelegate ()
- (NSFetchedResultsController*)fetchedCategories;
- (void)setDefoultCategories;
@end

@implementation AppDelegate

-(NSManagedObjectContext*)managedObjectContext{
    return self.persistentContainer.viewContext;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setDefoultCategories];
    
    CGRect frame = UIScreen.mainScreen.bounds;
    UIWindow *window = [[UIWindow alloc] initWithFrame:frame];
    _window = window;
    [window makeKeyAndVisible];
    
    TasksViewController *allTasks = [[TasksViewController alloc] initWithNibName:@"TasksViewController" bundle:nil];
    allTasks.navigationItem.title = @"All";
    UINavigationController *all = [[UINavigationController alloc] initWithRootViewController:allTasks];
    all.title = allTasks.navigationItem.title;
    all.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    TasksViewController *pendingTasks = [[TasksViewController alloc] initWithNibName:@"TasksViewController" bundle:nil];
    pendingTasks.navigationItem.title = @"Pending";
    UINavigationController *pending = [[UINavigationController alloc] initWithRootViewController:pendingTasks];
    pending.title = pendingTasks.navigationItem.title;
    pending.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    TasksViewController *completedTasks = [[TasksViewController alloc] initWithNibName:@"TasksViewController" bundle:nil];
    completedTasks.navigationItem.title = @"Completed";
    UINavigationController *completed = [[UINavigationController alloc] initWithRootViewController:completedTasks];
    completed.title = completedTasks.navigationItem.title;
    completed.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:all,pending,completed, nil];
    
    self.window.rootViewController = self.tabBarController;
    
    
    
    
    
    
    return YES;
}
- (NSFetchedResultsController*)fetchedCategories{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [NSEntityDescription entityForName:@"Category" inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    fetchRequest.sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    NSFetchedResultsController *fetchResults = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[self managedObjectContext] sectionNameKeyPath:nil cacheName:@"Master"];
    
    NSError *error = nil;
    if(![fetchResults performFetch:&error]){
        NSLog(@"%@",[error localizedDescription]);
        abort();
    }
    return fetchResults;
}

-(void)setDefoultCategories{
    NSFetchedResultsController *fetchedcategories = self.fetchedCategories;
    if(!fetchedcategories.fetchedObjects.count){
        NSArray *categorynames = [NSArray arrayWithObjects:@"Personal",@"Family",@"Business",@"Other", nil];
        
        for (NSString *name in categorynames){
            NSEntityDescription *entity = [[fetchedcategories fetchRequest] entity];
            NSManagedObject *category = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:[self managedObjectContext]];
            [category setValue:name forKey:@"name"];
            
        }
    }
}
-(NSArray*)categories {
    return self.fetchedCategories.fetchedObjects;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TaskManager"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
