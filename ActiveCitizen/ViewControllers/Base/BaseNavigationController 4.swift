//
//  BaseNavigationController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.interactivePopGestureRecognizer?.isEnabled = false
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /*
    -(__kindof UIViewController*)getViewControllerOfClass:(Class)classVar {
        
        for (__kindof UIViewController *vc in self.viewControllers) {
            if([vc isKindOfClass:classVar]){
                return vc;
            }
        }
        return nil;
    }*/

}
