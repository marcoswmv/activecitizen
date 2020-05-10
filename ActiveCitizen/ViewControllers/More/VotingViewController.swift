//
//  VotingViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class VotingViewController: TabmanViewController {
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    lazy var viewControllersList: [SubVotingViewController] = {
        let storyboard = UIStoryboard(name: "More", bundle: nil)
        var vc1 = storyboard.instantiateViewController(withIdentifier: String(format: "SubVotingViewController1")) as! SubVotingViewController
        var vc2 = storyboard.instantiateViewController(withIdentifier: String(format: "SubVotingViewController2")) as! SubVotingViewController
        var vc3 = storyboard.instantiateViewController(withIdentifier: String(format: "SubVotingViewController3")) as! SubVotingViewController
        return [vc1, vc2, vc3]
    }()
    
    lazy var titles: [String] = [ "ВСЕ", "НОВЫЕ", "ЗАВЕРШЕННЫЕ"]
    
    let bar = TMBar.ButtonBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar(bar: bar, view: tabBarView, viewController: self)
        setupCustomBackButton(with: "Опросы и голосования", icon: "back")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        setupNavigationBarShadow(activate: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        setupNavigationBarShadow(activate: true)
    }
}
