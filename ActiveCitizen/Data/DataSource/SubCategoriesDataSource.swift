//
//  SubCategoriesDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class SubCategoriesDataSource: BaseDataSource {

    private let manager = SubCategoriesManager()
    private(set) var data: [SubCategory]?
    
    var categoryID: Int?
    var defaultValues: UserDefaults = UserDefaults.standard
    
    override func setup() {
        DispatchQueue.once {
            defaultValues.removeObject(forKey: Keys.selectedSubCategory)
        }
        super.setup()
    }
    
    override func reload() {
        
        let users: [[String: Any]] = [[ "id": 1204, "parentId": 1102, "name": "Аварийные опоры линий наружного освещения"],
                                      [ "id": 1205, "parentId": 1102, "name": "Автомобильные дороги"],
                                      [ "id": 1206, "parentId": 1102, "name": "Водоснабжение в многоквартирном доме"],
                                      [ "id": 1207, "parentId": 1102, "name": "Газ и топливо"],
                                      [ "id": 1208, "parentId": 1102, "name": "Многоквартирные дома"],
                                      [ "id": 1209, "parentId": 1102, "name": "Общественный транспорт"],
                                      [ "id": 1210, "parentId": 1102, "name": "Плата за ЖКУ и работа ЕИРЦ"],
                                      [ "id": 1212, "parentId": 1102, "name": "Некорректная разметка проезжей части, отсутствие разметки"],
                                      [ "id": 1213, "parentId": 1102, "name": "Необходима установка и замена дорожных ограждений"],
                                      [ "id": 1214, "parentId": 1102, "name": "Неработающие линии наружного освещения"],
                                      [ "id": 1215, "parentId": 1102, "name": "Неработающие светильники"],
                                      [ "id": 1216, "parentId": 1102, "name": "Несанкционированное ограничение движения, помехи движению, захват земли в полосе отвода автодорог"],
                                      [ "id": 1217, "parentId": 1102, "name": "Несанкционированные свалки, мусор на дорогах"],
                                      [ "id": 1218, "parentId": 1102, "name": "Несоблюдение правил уборки проезжей части"],
                                      [ "id": 1219, "parentId": 1102, "name": "Обращения о необходимости вывезти снег после уборки"],
                                      [ "id": 1220, "parentId": 1102, "name": "Обращения о необходимости очистить автобусную остановку от снега и наледи"],
                                      [ "id": 1221, "parentId": 1102, "name": "Обращения о необходимости очистить дороги от снега и наледи"],
                                      [ "id": 1222, "parentId": 1102, "name": "Обращения о необходимости очистить тротуар от снега и наледи"],
                                      [ "id": 1223, "parentId": 1102, "name": "Обустройство велодорожек"],
                                      [ "id": 1224, "parentId": 1102, "name": "Обустройство пешеходного перехода"],
                                      [ "id": 1225, "parentId": 1102, "name": "Организация специализированных мест для инвалидов на существующих парковках"],
                                      [ "id": 1226, "parentId": 1102, "name": "Отсутствие люка, решетки канализации"],
                                      [ "id": 1227, "parentId": 1102, "name": "Подтопление автомобильных дорог"],
                                      [ "id": 1228, "parentId": 1102, "name": "Предложения по установке новых линий освещения"],
                                      [ "id": 1229, "parentId": 1102, "name": "Предложить (возразить) парковку на улично-дорожной сети"],
                                      [ "id": 1230, "parentId": 1102, "name": "Предложить дорогу в план ремонта"],
                                      [ "id": 1231, "parentId": 1102, "name": "Предложить тротуар в план строительства, обустройства"],
                                      [ "id": 1232, "parentId": 1102, "name": "Предложить установку нового лежачего полицейского (ИДН)"],
                                      [ "id": 1233, "parentId": 1102, "name": "Работа светофора (установка, изменение режима работы, оборудование кнопкой вызова)"],
                                      [ "id": 1234, "parentId": 1102, "name": "Ремонт и замена частей лежачих полицейских (ИДН)"],
                                      [ "id": 1235, "parentId": 1102, "name": "Содержание дорожных знаков"],
                                      [ "id": 1236, "parentId": 1102, "name": "Содержание дорожных ограждений, демонтаж аварийных дорожных ограждений"],
                                      [ "id": 1237, "parentId": 1102, "name": "Содержание и ремонт тротуаров"],
                                      [ "id": 1238, "parentId": 1102, "name": "Содержание парковочных мест"],
                                      [ "id": 1239, "parentId": 1102, "name": "Создание безбарьерной среды для инвалидов и маломобильных групп населения на объектах дорожной инфраструктуры"],
                                      [ "id": 1240, "parentId": 1102, "name": "Сообщить о бесхозяйной дороге"],
                                      [ "id": 1241, "parentId": 1102, "name": "Строительство или реконструкция дорог"],
                                      [ "id": 1242, "parentId": 1102, "name": "Уборка, чистка светильников, опор наружного освещения"],
                                      [ "id": 1243, "parentId": 1102, "name": "Укрепление обочин"],
                                      [ "id": 1244, "parentId": 1102, "name": "Установка дополнительных технических средств безопасности дорожного движения"],
                                      [ "id": 1245, "parentId": 1102, "name": "Установка новых дорожных знаков, с внесением в схему дислокации, замена старых знаков на новые"],
                                      [ "id": 1246, "parentId": 1102, "name": "Ямы и выбоины на дороге"]]
        
        var hardCodedresult = [SubCategory]()

        for user in users {
            hardCodedresult.append(SubCategory(dictionary: user))
        }

        data = hardCodedresult
        tableView.reloadData()
        
//        onLoading?(true)
//        manager.getSubCategories(categoryId: categoryID!, completion: { (result, error) in
//            self.onLoading?(false)
//            if error != nil {
//                self.onError?(error!)
//                return
//            }
//
//            self.data = result
//            self.tableView.reloadData()
//        })
    }
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: SubCategoriesTableViewCell.identifier)! as! SubCategoriesTableViewCell
        
        cell.data = data![indexPath.row]
        
        if let selectedRow = defaultValues.value(forKey: Keys.selectedSubCategory) as? Int {
            let selectedIndexPath = IndexPath(row: selectedRow, section: indexPath.section)
            
            if indexPath == selectedIndexPath {
                cell.textLabel?.font = UIFont(name: UIFont.mediumFontFmily, size: 15.0)
                cell.accessoryView = UIImageView(image: UIImage(named: "chek-on"))
            } else {
                cell.textLabel?.font = UIFont(name: UIFont.regularFontFmily, size: 15.0)
                cell.accessoryView = UIImageView(image: UIImage())
            }
        }
        
        return cell
    }
}
