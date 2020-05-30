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
    
    private var filteredData: [Vote]?
    private var searching: Bool = false
    var caseID: String?
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
//           TO-DO: get votes form each case by caseID after authorization
        
        var result = [Vote]()
        _ = DummyData.votes.map({ result.append(Vote(dictionary: $0)) })

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
    
    func startQuery(with text: String) {
        searching = !text.isEmpty ? true : false
        filteredData = data?.filter({ $0.message!.prefix(text.count).lowercased() == text.lowercased() })
        tableView.reloadData()
    }
        // MARK: - DataSource
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            if filteredData!.isEmpty {
                addTableViewBackgroundView()
            }
            return filteredData?.count ?? 0
        } else {
            if data!.isEmpty {
                addTableViewBackgroundView()
            }
            return data?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: VoteTableViewCell.identifier) as! VoteTableViewCell
        
        if searching {
            cell.data = filteredData![indexPath.row]
        } else {
            cell.data = data![indexPath.row]
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    func addTableViewBackgroundView() {
        let noDataLabel = UILabel(frame: CGRect(x: 0, y: 0,
                                                width: tableView.bounds.size.width,
                                                height: tableView.bounds.size.height))
        noDataLabel.text = "Нет опросов и голосований"
        noDataLabel.font = UIFont(name: UIFont.regularFontFmily, size: 17.0)
        noDataLabel.textAlignment = .center
        tableView.backgroundView = noDataLabel
    }
}
