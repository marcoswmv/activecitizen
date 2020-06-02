//
//  RootTabBarController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController /*, UITabBarDelegate*/ {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarShadow()
    }
    
    // TODO:
    
//    typedef NS_ENUM(NSInteger, RootTabBarTab) {
//        RootTabBarHome = 0,
//        RootTabBarPayments = 1,
//        RootTabBarCards = 2,
//        RootTabBarCredits = 3,
//        RootTabBarOther = 4
//    };
//
//    - (void)viewDidLoad {
//        [super viewDidLoad];
//
//        self.selectedViewController = self.viewControllers[RootTabBarHome];
//    /*
//        self.tabBar.layer.shadowOffset = CGSizeMake(0, 0);
//        self.tabBar.layer.shadowRadius = 6;
//        self.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
//        self.tabBar.layer.shadowOpacity = 0.15;
//        // Remove border
//        self.tabBar.backgroundImage = [[UIImage alloc] init];
//        self.tabBar.shadowImage = [[UIImage alloc] init];
//    */
//
//        for (UITabBarItem *item in self.tabBar.items) {
//
//            if(UIDevice.currentDevice.isIphoneXFamily){
//                item.titlePositionAdjustment = UIOffsetMake(0, 7);
//                item.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
//            }else{
//                item.titlePositionAdjustment = UIOffsetMake(0, -5);
//                item.imageInsets = UIEdgeInsetsMake(-6, 0, 0, 0);
//            }
//        }
//    }
//
//    -(void)setTab:(RootTabBarTab)tab {
//        self.selectedViewController = self.viewControllers[tab];
//    }
//
//
//    - (UIStatusBarStyle)preferredStatusBarStyle {
//        return UIStatusBarStyleLightContent;
//    }
//
//
//    -(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
//
//        UIViewController *vc = self.selectedViewController;
//        if([vc isKindOfClass:UINavigationController.class]){
//            vc = ((UINavigationController*)vc).viewControllers.firstObject;
//        }
//
//        if([vc isKindOfClass:BaseViewController.class]){
//            [(BaseViewController*)vc didSelectTab];
//        }
//
//    }
    
}
