//
//  ReportsTableViewController+SearchDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension BaseViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        cancelSearchTimer()
        search(query: searchBar.text)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        cancelSearchTimer()
        search(query: searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        cancelSearchTimer()
        search(query: nil)
        searchBar.text = ""
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchIfNedded(query: searchText)
    }
    
    func cancelSearchTimer()  {
        if timer != nil, timer!.isValid {
            timer?.invalidate()
            timer = nil
        }
        
    }
    
    func searchIfNedded(query: String?) {
        cancelSearchTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (timer) in
            self.search(query: query)
        })
    }
    
    func search(query: String?)  {
        print(query ?? "none")
    }
}
