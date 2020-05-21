//
//  AboutViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class AboutViewController: TabmanViewController {
    
    @IBOutlet weak var tabBarView: UIView!
    
    lazy var viewControllersList: [SubAboutViewController] = {
        let storyboard = UIStoryboard(name: "More", bundle: nil)
        var vc1 = storyboard.instantiateViewController(withIdentifier: String(format: "SubAboutViewController1")) as! SubAboutViewController
        var vc2 = storyboard.instantiateViewController(withIdentifier: String(format: "SubAboutViewController2")) as! SubAboutViewController
        var vc3 = storyboard.instantiateViewController(withIdentifier: String(format: "SubAboutViewController3")) as! SubAboutViewController
        var vc4 = storyboard.instantiateViewController(withIdentifier: String(format: "SubAboutViewController4")) as! SubAboutViewController
        return [vc1, vc2, vc3, vc4]
    }()
    
    lazy var titles: [String] = [ "ИНСТРУКЦИЯ", "СОГЛАШЕНИЯ", "РЕГЛАМЕНТЫ", "ЧАСТЫЕ ВОПРОСЫ"]
    let bar = TMBar.ButtonBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar(bar: bar, view: tabBarView, viewController: self)
        setupCustomBackButton(with: "О программе", icon: "back")
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
