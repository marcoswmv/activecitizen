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
    private var filteredData: [Member]?
    private var searching: Bool = false
    
    override func setup() {
       super.setup()
    }

    override func reload() {
        
        var result = [Member]()
        _ = DummyData.users.map({ result.append(Member(dictionary: $0)) })

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
    
    func startQuery(with text: String) {
        searching = !text.isEmpty ? true : false
        filteredData = data?.filter({ $0.name!.prefix(text.count).lowercased() == text.lowercased() })
        tableView.reloadData()
    }
    

    // MARK: - DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if searching {
           return filteredData?.count ?? 0
       } else {
           return data?.count ?? 0
       }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MembersTableViewCell.identifier)! as! MembersTableViewCell
        
        if searching {
            cell.data = filteredData![indexPath.row]
        } else {
            cell.data = data![indexPath.row]
        }
        
        cell.userPhoto.layer.cornerRadius = (cell.userPhoto.frame.width) / 2
        cell.selectionStyle = .none
        
        return cell
    }

}
