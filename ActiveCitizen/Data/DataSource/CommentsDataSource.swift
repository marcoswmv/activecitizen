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
        
        let comments: [[String: Any]] = [[ "categoryId": 1101, "created": "2013-12-02T19:13:16.167+0000", "categoryName": "Автомобильные дороги",
                                          "subcategoryName": "Аварийные опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "files": ["thor1"], "taskDefinitionKey": "taskEnterResult"],
                                        [ "categoryId": 1102, "created": "2020-1-02T19:13:16.167+0000", "categoryName": "Автомобильные орфвлытоылчы",
                                        "subcategoryName": "Аварийные опоры линиаватртноьй наружного оносвещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "files": [], "taskDefinitionKey": "taskAcceptance"],
                                        [ "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                          "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "files": ["thor2", "thor3"], "taskDefinitionKey": "taskRejected"]]


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
