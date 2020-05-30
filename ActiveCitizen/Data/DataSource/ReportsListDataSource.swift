//
//  ReportsListDataSource.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsListDataSource: BaseDataSource {

    private let manager = ReportsManager()
    private(set) var data: [Report]?
    
    private var filteredData: [Report]?
    private var searching: Bool = false
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
        
        
        let reports: [[String: Any]] = [[ "id": 123, "categoryId": 1101, "created": "2013-12-02T19:13:16.167+0000", "categoryName": "Автомобильные дороги",
                                          "subcategoryName": "Аварийные опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog1"], "taskDefinitionKey": "TaskEnterResult"],
                                        [ "id": 456, "categoryId": 1102, "created": "2020-1-02T19:13:16.167+0000", "categoryName": "Автомобильные орфвлытоылчы",
                                        "subcategoryName": "Аварийные опоры линиаватртноьй наружного оносвещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "coordinates": "48.72650460064742,44.48047016906738", "files": [], "taskDefinitionKey": "TaskAcceptance"],
                                        [ "id": 789, "categoryId": 1103, "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                          "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "coordinates": "48.72650460064742,44.48047016906738", "files": ["dog2", "dog3"], "taskDefinitionKey": "TaskRejected"]]
        
        
        var result = [Report]()

        for report in reports {
            result.append(Report(dictionary: report))
        }

        data = result
        tableView.reloadData()
        
        
//        onLoading?(true)
//        
//        manager.getReportsList { (result, error) in
//            
//            self.onLoading?(false)
//            if error != nil {
//                self.onError?(error!)
//                return
//            }
//            
//            self.data = result
//            self.tableView.reloadData()
//        }
    }
    
    func startQuery(with text: String) {
        searching = !text.isEmpty ? true : false
        filteredData = data?.filter({ $0.id?.description.prefix(text.count).description == text })
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
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ReportsListTableViewCell.identifier)! as! ReportsListTableViewCell
        
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
        noDataLabel.text = "Нет обращений"
        noDataLabel.font = UIFont(name: UIFont.regularFontFmily, size: 15.0)
        noDataLabel.textAlignment = .center
        tableView.backgroundView = noDataLabel
    }
    
}
