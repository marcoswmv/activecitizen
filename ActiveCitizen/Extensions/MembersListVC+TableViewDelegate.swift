//
//  UsersListViewController+TableViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 13.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension MembersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let memberViewController = MemberDetailViewController.instantiate() as! MemberDetailViewController
        let row = indexPath.row
        
        let memberID = dataSource?.data![row].id
        let photo = dataSource?.data![row].photo
        let name = dataSource?.data![row].name
        
        memberViewController.memberID = memberID
        memberViewController.photoToReceive = photo
        memberViewController.nameToReceive = name
        
        if let solvedProblems = dataSource?.data![row].solvedProblems,
            let applications = dataSource?.data![row].activeApplications {
            memberViewController.solvedProblemsToReceive = "\(solvedProblems)"
            memberViewController.applicationsToReceive = "\(applications)"
        }
        
        navigationController?.pushViewController(memberViewController, animated: true)
    }
}
