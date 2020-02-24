//
//  SpecifyAddressViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 06.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class EnterAddressViewController: BaseEnterAddressViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func enterAddressManuallyOnTouchUpInside(_ sender: Any) {
        let enterAddressManuallyViewController = EnterAddressManuallyViewController.instantiate() as! EnterAddressManuallyViewController
        
        enterAddressManuallyViewController.completionHandler = { street, city in
//            Data for test
            self.testStreets.append(street)
            self.testCities.append(city)
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(enterAddressManuallyViewController, animated: true)
    }
    
//        Data for test
    var testStreets: [String] = ["Большая Санкт-Петербургская прармооо, 12", "Завокзальная улица, 13", "Ломоновская улица, 45", "Хутынская улица, 1", "Несквий проспект опрмгиооронр анмеагпнп, 12"]
    var testCities: [String] = ["Великий Новгород, Новгородская область, Россия", "Тамбов, Россия",
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
