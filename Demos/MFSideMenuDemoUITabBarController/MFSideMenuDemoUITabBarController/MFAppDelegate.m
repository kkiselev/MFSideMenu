//
//  MFAppDelegate.m
//  MFSideMenuDemoUITabBarController
//
//  Created by Michael Frederick on 3/19/13.
//  Copyright (c) 2013 Michael Frederick. All rights reserved.
//

#import "MFAppDelegate.h"
#import "MFSideMenu.h"
#import "DemoViewController.h"
#import "SideMenuViewController.h"

@implementation MFAppDelegate

@synthesize window = _window;

- (DemoViewController *)demoController {
    return [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil];
}

- (UINavigationController *)navigationController {
    return [[UINavigationController alloc]
            initWithRootViewController:[self demoController]];
}

- (MFSideMenu *)sideMenuL:(SideMenuViewController *)left R:(SideMenuViewController *)right {
    UINavigationController *navigationController = [self navigationController];
    
    MFSideMenu *sideMenu = [MFSideMenu menuWithNavigationController:navigationController
                                             leftSideMenuController:left
                                            rightSideMenuController:right];
    
    left.sideMenu = sideMenu;
    right.sideMenu = sideMenu;
    
    return sideMenu;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    SideMenuViewController *leftSideMenuController = [[SideMenuViewController alloc] init];
    SideMenuViewController *rightSideMenuController = [[SideMenuViewController alloc] init];
    
    NSMutableArray *controllers = [NSMutableArray new];
    [controllers addObject: [[UINavigationController alloc] initWithRootViewController: [[UIViewController alloc] init]]];
    [controllers addObject:[self sideMenuL: leftSideMenuController R: rightSideMenuController].navigationController];
    [controllers addObject:[self sideMenuL: leftSideMenuController R: rightSideMenuController].navigationController];
    [controllers addObject:[self sideMenuL: leftSideMenuController R: rightSideMenuController].navigationController];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:controllers];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
