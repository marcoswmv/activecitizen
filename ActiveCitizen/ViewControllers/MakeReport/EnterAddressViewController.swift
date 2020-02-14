//
//  SpecifyAddressViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 06.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class EnterAddressViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func enterAddressManuallyOnTouchUpInside(_ sender: Any) {
        let makeReportStoryboard = UIStoryboard(name: "MakeReport", bundle: nil)
        let enterAddressManuallyViewController = makeReportStoryboard.instantiateViewController(withIdentifier: "EnterAddressManuallyViewController") as! EnterAddressManuallyViewController
        
        navigationController?.pushViewController(enterAddressManuallyViewController, animated: true)
    }
    
    //        Data for test
    let testStreets: [String] = ["Большая Санкт-Петербургская прармооо, 12", "Завокзальная улица, 13", "Ломоновская улица, 45", "Хутынская улица, 1", "Несквий проспект опрмгиооронр анмеагпнп, 12"]
    let testCities: [String] = ["Великий Новгород, Новгородская область, Россия", "Тамбов, Россия",
                                "Москва, Московская Область, Россия", "Волгоград, Волгоградская Область, Россия", "Санкт-Петербург, Ленинградская Область, Россия"]

    var completionHandler: ((String, String) -> Void)?
    var selectedCity: String?
    var selectedStreet: String?
    var selectedCell: EnterAddressTableViewCell? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton(titleText: "Уточните адрес")
        setupNavigationBarShadow()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}
