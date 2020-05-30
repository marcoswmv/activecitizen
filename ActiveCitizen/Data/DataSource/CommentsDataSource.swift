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
        
        let comments: [[String: Any]] = [[ "id": 2258,
                                           "taskDefinitionKey": "TaskModeration",
                                           "message": "Комментарий через REST API",
                                           "organizationId": 1232,
                                           "authority": "Заявитель",
                                           "files": ["dog6"],
                                           "firstName": "Евгений",
                                           "lastName": "Павлов",
                                           "creationTime": "2020-01-27T18:15:32.862+0000"],
                                         [ "id": 2233,
                                           "taskDefinitionKey": "TaskModeration",
                                           "message": "Обращение создано и передано на модерацию",
                                           "organizationId": 8765,
                                           "authority": "Заявитель",
                                           "files": ["dog4, dog5"],
                                           "firstName": "Евгений",
                                           "lastName": "Павлов",
                                           "creationTime": "2020-01-27T14:51:19.765+0000"],
                                         [ "id": 2043,
                                           "taskDefinitionKey": "TaskPerformanceEvaluation",
                                           "message": "Обращение завершено",
                                           "files": ["dog7"],
                                           "organizationId": 1672,
                                           "authority": "Модератор",
                                           "firstName": "Алексей",
                                           "lastName": "Кантов",
                                           "creationTime": "2020-01-30T1:56:19.765+0000"]]


        var result = [Comment]()

        for comment in comments {
            result.append(Comment(dictionary: comment))
        }

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
