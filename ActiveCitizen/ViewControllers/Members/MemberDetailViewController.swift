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
    
    
    
    var dataSource: MemberReportsDataSource?
    var member: Member?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        setupUIElements()
    }
    
    func setupDataSource(with filter: String? = nil) {
        dataSource = MemberReportsDataSource(tableView: self.tableView)
        dataSource?.onLoading = { (isLoading) in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.memberID = self.member?.id
        dataSource?.filter = filter
        dataSource?.reload()
    }
    
    func setupUIElements() {
        userPhoto.image = member?.photo
        userName.text = member?.name
        solvedProblems.text = member?.solvedProblems?.description
        applications.text = member?.activeApplications?.description
        keyboardManagment = true
    }

}
