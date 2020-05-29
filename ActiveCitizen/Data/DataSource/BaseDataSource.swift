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
    
}
