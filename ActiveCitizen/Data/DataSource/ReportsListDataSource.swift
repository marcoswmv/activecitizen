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
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
        
        
        let reports: [[String: Any]] = [[ "created": "2013-12-02T19:13:16.167+0000", "categoryName": "Автомобильные дороги",
                                          "subcategoryName": "Аварийные опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "files": ["54664934-af08-4b8e-9858-2131e79d0578"]],
                                        [ "created": "2020-1-02T19:13:16.167+0000", "categoryName": "Автомобильные орфвлытоылчы",
                                        "subcategoryName": "Аварийные опоры линиаватртноьй наружного оносвещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "files": ["54664934-af08-4b8e-9858-2131e79d0578"]],
                                        [ "created": "2021-2-02T19:13:16.167+0000", "categoryName": "Авфылврифыыловилфсыльные дороги",
                                        "subcategoryName": "Аварийныефмывамвамав опоры линий наружного освещения", "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47", "files": ["54664934-af08-4b8e-9858-2131e79d0578"]]]
        
        
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
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ReportsListTableViewCell.identifier)! as! ReportsListTableViewCell
        cell.data = data![indexPath.row]
        return cell
    }
    
}
