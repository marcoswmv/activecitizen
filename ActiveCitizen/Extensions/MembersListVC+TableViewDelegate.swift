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
        let member = dataSource?.data![row]
        
        memberViewController.member = member
        navigationController?.pushViewController(memberViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}
