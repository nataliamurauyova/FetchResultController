//
//  AppDelegate.h
//  TaskManager
//
//  Created by Nataliya Murauyova on 7/20/18.
//  Copyright © 2018 Nataliya Murauyova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property(strong,nonatomic) UITabBarController *tabBarController;

- (void)saveContext;
-(NSManagedObjectContext*)managedObjectContext;
//-(NSURL*)applicationDocumentsDirectory;


@end

