//
//  FiltersViewController+TableViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import Foundation
import UIKit

extension FilterCategoriesViewController: UITableViewDelegate {
    
    
//    TO-DO: GET DATA FROM HTTP SERVER
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let filtersViewController = FiltersViewController.instantiate() as! FiltersViewController
        var dataToPass = [String]()
        
        defaultValues.set(indexPath.row, forKey: Keys.selectedFilterCategory)
        
        if indexPath.row == 0 {
            navigationController?.popViewController(animated: true)
        } else if indexPath.row == 1 {
            
            dataToPass = ["Не выбрано", "На модерации", "Принято в обработку", "Первичное рассмотрение исполнителем", "Работа выполнена", "Повторное обращение", "Уведомление заявителя"]
            
            filtersViewController.navigationBarTitle = "Статус"
            filtersViewController.data = dataToPass
            filtersViewController.completionHandler = { filter  in
                self.completionHandler?(filter)
            }
            navigationController?.pushViewController(filtersViewController, animated: true)
        } else if indexPath.row == 2 {
            
//            setupCategoriesDataSource()
            dataToPass = ["Не выбрано", "Автомобильные дороги", "Газ и топливо", "Многоквартирные  дома", "Общественный транспорт", "Народный инспектор"]
            
            filtersViewController.navigationBarTitle = "Категория"
            filtersViewController.data = dataToPass
            filtersViewController.completionHandler = { filter  in
                self.completionHandler?(filter)
            }
            navigationController?.pushViewController(filtersViewController, animated: true)
        } else if indexPath.row == 3 {
            
//            TO-DO: CHECK TO SEE WHICH FILTERS ARE AVAILABLE IN THIS CATEGORY
            dataToPass = ["Не выбрано", "Весь период", "Неделя назад", "Месяц назад", "3 месяца назад"]
            
            filtersViewController.navigationBarTitle = "Период"
            filtersViewController.data = dataToPass
            filtersViewController.completionHandler = { filter  in
                self.completionHandler?(filter)
            }
            navigationController?.pushViewController(filtersViewController, animated: true)
        }
    }
    
    func setupCategoriesDataSource() {
        categoriesDataSource = CategoriesDataSource(tableView: self.tableView)
        categoriesDataSource?.onLoading = { isLoading in
            self.displayLoading(loading: isLoading)
        }
        categoriesDataSource?.reload()
    }
}
