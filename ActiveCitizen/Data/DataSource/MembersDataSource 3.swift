//
//  UsersDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class MembersDataSource: BaseDataSource {

    private let manager = MembersManager()
    private(set) var data: [Member]?

    override func setup() {
       super.setup()
    }

    override func reload() {
        
        
        let users: [[String: Any]] = [[ "fio": "Vicente Marcos", "active": 10, "completed": 43, "rejected": 68],
                                      [ "fio": "Бунтов Алексей", "active": 45, "completed": 98, "rejected": 0],
                                      [ "fio": "Корненко Мария", "active": 3, "completed": 6, "rejected": 1],
                                      [ "fio": "User name", "active": 1, "completed": 2, "rejected": 3],
                                      [ "fio": "Другой пользователь", "active": 4, "completed": 5, "rejected": 0000],
                                      [ "fio": "Федорова Алина", "active": 3548, "completed": 676, "rejected": 741]]
        var result = [Member]()
        
        for user in users {
            result.append(Member(dictionary: user))
        }
        
        data = result
        tableView.reloadData()
        
//        onLoading?(true)
//        
//        manager.getMemberUsers(completion: { (result, error) in
//           self.onLoading?(false)
//           if error != nil {
//               self.onError?(error!)
//               return
//           }
//
//           self.data = result
//           self.tableView.reloadData()
//        })
    }

    // MARK: - DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MembersTableViewCell.identifier)! as! MembersTableViewCell
        
        cell.data = data![indexPath.row]
        
//        cell.setCustomCellStyle(for: cell.subContentView)
        cell.userPhoto.layer.cornerRadius = (cell.userPhoto.frame.width) / 2
        cell.selectionStyle = .none
        
        return cell
    }

}
