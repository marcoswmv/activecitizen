//
//  BaseDataSource.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private(set) var tableView: UITableView
    var onError: ((_ error: Error) -> ())?
    var onLoading: ((_ isLoading: Bool) -> ())?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
        super.init()
        setup()
    }
    
    func setup() {
        self.tableView.dataSource = self
    }
    
    func reload() {
        fatalError("Not implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("Not implemented")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Not implemented")
    }
    
    func addTableViewBackgroundView(with text: String) {
        let noDataLabel = UILabel(frame: CGRect(x: 0, y: 0,
                                                width: tableView.bounds.size.width,
                                                height: tableView.bounds.size.height))
        noDataLabel.text = text
        noDataLabel.font = UIFont(name: UIFont.regularFontFmily, size: 17.0)
        noDataLabel.textAlignment = .center
        tableView.backgroundView = noDataLabel
    }
}
