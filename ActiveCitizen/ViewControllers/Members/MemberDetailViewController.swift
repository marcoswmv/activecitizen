//
//  UserViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 13.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class MemberDetailViewController: BaseMemberViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var solvedProblems: UILabel!
    @IBOutlet weak var applications: UILabel!
    

    @IBAction func showFilterCategoriesOnTouchUpInside(_ sender: Any) {
        let filterCategoriesViewController = FilterCategoriesViewController.instantiate() as! FilterCategoriesViewController
        
        filterCategoriesViewController.completionHandler = { filter in
            self.setupDataSource(with: filter)
        }
        navigationController?.pushViewController(filterCategoriesViewController, animated:true)
    }
    
    var dataSource: MemberDetailsDataSource?
    
    var memberID: Int?
    var photoToReceive: UIImage?
    var nameToReceive: String?
    var solvedProblemsToReceive: String?
    var applicationsToReceive: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupDataSource()
        setupUIElements()
    }
    
    func setupDataSource(with filter: String? = nil) {
        dataSource = MemberDetailsDataSource(tableView: self.tableView)
        dataSource?.onLoading = { (isLoading) in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.memberID = self.memberID
        dataSource?.filter = filter
        dataSource?.reload()
    }
    
    func setupUIElements() {
        userPhoto.image = photoToReceive
        userName.text = nameToReceive
        solvedProblems.text = solvedProblemsToReceive
        applications.text = applicationsToReceive
    }

}
