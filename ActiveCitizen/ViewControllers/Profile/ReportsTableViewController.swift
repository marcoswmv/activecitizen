//
//  ReportsTableViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 19.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsTableViewController: BaseViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
