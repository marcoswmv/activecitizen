//
//  FillFieldViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 17.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class FillFieldViewController: UIViewController {

    var navigationBarTitle: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton(titleText: navigationBarTitle!)
        setupNavigationBarShadow()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
