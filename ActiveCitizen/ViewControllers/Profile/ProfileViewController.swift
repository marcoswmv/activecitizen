//
//  ProfileViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class ProfileViewController: TabmanViewController {
    
    @IBOutlet weak var userInformationView: UserInformationView!
    @IBOutlet weak var tabBarView: UIView!
    
    lazy var viewControllersList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "NotificationsTableViewController") as! NotificationsTableViewController
        let vc2 = storyboard.instantiateViewController(withIdentifier: "ReportsTableViewController") as! ReportsTableViewController
        return [ vc1, vc2]
    }()
    
    lazy var titles: [String] = [ "УВЕДОМЛЕНИЯ", "ОБРАЩЕНИЯ"]
    let bar = TMBar.ButtonBar()
    
    var user: Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar(bar: bar, view: tabBarView, viewController: self, contentMode: .fit)
        setupUserInformation()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupUserInformation() {
        userInformationView.photo.image = UIImage(named: "placeholder")
        userInformationView.fullName.setTitle("Александр Филинков Юрьевич", for: .normal)
        userInformationView.cityAddress.text = "Одинцовский городской округ"
        userInformationView.streetAddress.text = "104 место по району/округу"
    }
}
