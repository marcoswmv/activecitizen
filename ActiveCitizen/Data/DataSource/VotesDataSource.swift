//
//  VotesDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 11.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class VotesDataSource: BaseDataSource {
    
    private let manager = VotesManager()
        private(set) var data: [Vote]?
        
        var caseID: String?
        
        override func setup() {
            super.setup()
        }
        
        override func reload() {
            
            let votes: [[String: Any]] = [ [ "id": 1234, "message": "Оценка проектов благоустройства Великого Новгорода", "date": "20.20.2020"],
                                           [ "id": 5678, "message": "Some random text just test this data", "date": "24.5.2020"],
                                           [ "id": 91011, "message": "Другой текст для тестирования", "date": "8.8.2020"]]

            var result = [Vote]()

            for vote in votes {
                result.append(Vote(dictionary: vote))
            }

            data = result
            tableView.reloadData()

//            onLoading?(true)
//
//            if let caseID = caseID {
//                manager.getVotes(with: caseID, completion: { (result, error) in
//
//                    self.onLoading?(false)
//                    if error != nil {
//                        self.onError?(error!)
//                        return
//                    }
//
//                    self.data = result
//                    self.tableView.reloadData()
//                })
//            }
            
        }
        
        // MARK: - DataSource
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data?.count ?? 0
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = self.tableView.dequeueReusableCell(withIdentifier: VoteTableViewCell.identifier) as! VoteTableViewCell
            
            cell.data = data![indexPath.row]
            cell.selectionStyle = .none
            
            return cell
        }
}
