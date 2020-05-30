//
//  ProgressDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 30.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class CommentsDataSource: BaseDataSource {

    private let manager = CommentsManager()
    private(set) var data: [Comment]?
    
    var caseID: String?
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {

        var result = [Comment]()
        _ = DummyData.comments.map({ result.append(Comment(dictionary: $0)) })

        data = result
        tableView.reloadData()
        
        
//        onLoading?(true)
//        
//        if let caseID = caseID {
//            manager.getComments(with: caseID, completion: { (result, error) in
//
//                self.onLoading?(false)
//                if error != nil {
//                    self.onError?(error!)
//                    return
//                }
//
//                self.data = result
//                self.tableView.reloadData()
//            })
//        }
        
    }
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier)! as! CommentTableViewCell
        
        cell.data = data![indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
}
