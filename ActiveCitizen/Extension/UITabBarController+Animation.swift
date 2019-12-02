//
//  UITabBarController+Animation.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    // TODO
    /*
    -(void)setTabBarVisible:(BOOL)visible duration:(CGFloat)duration animated:(BOOL)animated {
        if ([self tabBarIsVisible] == visible) { return; }
        
        const CGFloat visibleY = UIScreen.mainScreen.bounds.size.height - self.tabBar.frame.size.height;
        const CGFloat hiddenY = UIScreen.mainScreen.bounds.size.height;
        
        if(visible){
            self.tabBar.hidden = NO;
            [self.view setNeedsDisplay];
            [self.view layoutIfNeeded];
        }
        
        CGFloat startY = visible ? hiddenY : visibleY;
        CGFloat targetY = visible ? visibleY : hiddenY;
        
        self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, startY, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:duration curve:UIViewAnimationCurveEaseInOut animations:^{
            
            self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, targetY, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
            //self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height + offsetY);
            [self.view setNeedsDisplay];
            [self.view layoutIfNeeded];
        }];
        [animator addCompletion:^(UIViewAnimatingPosition finalPosition) {
            if(!visible){
                self.tabBar.hidden = YES;
            }
        }];
        [animator startAnimation];
    }

    -(BOOL)tabBarIsVisible {
        return (self.tabBar.frame.origin.y < UIScreen.mainScreen.bounds.size.height) && !self.tabBar.hidden;
    }
    */
}
