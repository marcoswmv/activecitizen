//
//  Report.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class Report {

    var id: Int?
    var userID: Int?
    var caseID: String?
    var created: Date?
    var categoryIcon: UIImage?
    var categoryId: Int?
    var categoryName: String?
    var subcategoryId: Int?
    var subcategoryName: String?
    var description: String?
    var address: String?
    var latitude: Double?
    var longitude: Double?
    var imagesIDs: [String]?
    var status: String?
    
    init(dictionary: [String : Any]) {
        
        id = dictionary["id"] as? Int
        userID = dictionary["userId"] as? Int
        caseID = dictionary["caseId"] as? String
        created = (dictionary["created"] as? String)?.parseISO8601()
        categoryId = dictionary["categoryId"] as? Int
        categoryName = dictionary["categoryName"] as? String
        subcategoryId = dictionary["subcategoryId"] as? Int
        subcategoryName = dictionary["subcategoryName"] as? String
        description = dictionary["description"] as? String
        address = dictionary["address"] as? String
        status = dictionary["taskDefinitionKey"] as? String
        categoryIcon = getIcon(id: categoryId!)
        imagesIDs = dictionary["files"] as? [String]
        
        
        if let coordsString = dictionary["coordinates"] as? String {
            let coords = coordsString.split(separator: ",");
            latitude = Double(String(coords.first!))
            longitude = Double(String(coords.last!))
        }
    }
    
    func getIcon(id: Int) -> UIImage {
        switch id {
        case 1101:
            return UIImage.yardArea!
        case 1102:
            return UIImage.road!
        case 1103:
            return UIImage.water!
        case 1104:
            return UIImage.fire!
        case 1105:
            return UIImage.buildings!
        case 1106:
            return UIImage.publicTransport!
        case 1107:
            return UIImage.payments!
        case 1108:
            return UIImage.empty
        default:
            return UIImage()
        }
    }
    
//    {
//        "id": 3958,
//        "caseId": "27903ce1-1537-11ea-87f0-0242ac110002",
//        "currentCaseId": "cb046983-1537-11ea-87f0-0242ac110002",
//        "moderatorId": null,
//        "executorId": null,
//        "created": "2019-12-02T19:13:16.167+0000",
//        "due": null,
//        "priority": "50",
//        "taskDefinitionKey": "TaskPerformanceEvaluation",
//        "userId": 19504,
//        "categoryId": 1102,
//        "categoryName": "Автомобильные дороги",
//        "subcategoryId": 1204,
//        "subcategoryName": "Аварийные опоры линий наружного освещения",
//        "description": "Тест 2019-12-02 22:09",
//        "comment": null,
//        "files": [
//            "54664934-af08-4b8e-9858-2131e79d0578"
//        ],
//        "address": "Россия, Волгоград, посёлок Ангарский, Раздольная улица, 47",
//        "coordinates": "48.72650460064742,44.48047016906738",
//        "moderation_comment": "Обращение передано исполнителю",
//        "execution_comment": null,
//        "complete_time": null,
//        "reactivation": 0,
//        "organizationid": "53558908",
//        "viewed": null,
//        "unviewed_count": 0
//    },
    
}
