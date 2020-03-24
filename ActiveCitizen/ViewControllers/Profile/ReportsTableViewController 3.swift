//
//  ReportsTableViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 19.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsTableViewController: BaseViewController, UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello from didSelectRowAt")
    }
}
