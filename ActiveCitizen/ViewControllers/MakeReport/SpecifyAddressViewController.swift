//
//  SpecifyAddressViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 06.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

protocol AddressDelegate: AnyObject {
    func setAddress(with street: String, and city: String)
}

class SpecifyAddressViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
//        Data for test
    let testStreets: [String] = ["Большая Санкт-Петербургская, 12", "Завокзальная улица, 13", "Ломоновская улица, 45", "Хутынская улица, 1", "Несквий проспект, 12"]
    let testCities: [String] = ["Великий Новгород, Новгородская область, Россия", "Тамбов, Россия",
                                "Москва, Московская Область, Россия", "Волгоград, Волгоградская Область, Россия", "Санкт-Петербург, Ленинградская Область, Россия"]

    var indexPathForSelectedCell: IndexPath?
    var buttonPosition: CGPoint?
    var selectAddressDelegate: AddressDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
    }
    
    @IBAction func returnAddressOnTouchUpInside(_ sender: UIButton) {
        let row = sender.tag
        buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        
        guard let position = buttonPosition else { return }
        layoutSelectedCell(on: position)
        
        // Data for test
        selectAddressDelegate?.setAddress(with: testStreets[row],
                                          and: testCities[row])
        navigationController?.popViewController(animated: true)
    }
    
    func layoutSelectedCell(on buttonPosition: CGPoint) {
        indexPathForSelectedCell = self.tableView.indexPathForRow(at: buttonPosition)
        
        guard let indexPath = indexPathForSelectedCell else { return }
        let cell = tableView.cellForRow(at: indexPath) as! SpecifyAddressTableViewCell

        cell.isSelected = true
        if cell.isSelected {
            cell.shadowLayer.isHidden = true
            cell.streetAddress.textColor = .black
            cell.backgroundColor = .white
            cell.contentView.borderColor = .gray
            cell.contentView.borderWidth = 1
        }
    }
}
