//
//  Notification.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 31.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class Comment {
    
    var changedStatus: String?
    var message: String?
    var files: String?
    var organizationID: String?
    var authority: String? // autor label
    var autorFirstName: String? // firstName
    var autorLastName: String? // lastName
    var publicationDate: Date?
    
    init(dictionary: [String: Any]) {
        self.changedStatus = dictionary["taskDefinitionKey"] as? String
        self.message = dictionary["message"] as? String
        self.files = dictionary["files"] as? String
        self.organizationID = dictionary["organizationId"] as? String
        self.authority = dictionary["authority"] as? String
        self.autorFirstName = dictionary["firstName"] as? String
        self.autorLastName = dictionary["lastName"] as? String
        self.publicationDate = (dictionary["creationTime"] as? String)?.parseISO8601()
    }
    
}




/*
 https://active-citizen.ru/rest/activity/byCase?caseId=7a6aeb64-4114-11ea-8578-0242ac120006
 
 {
     "result": "OK",
     "data": [
         {
             "id": 2258,
             "caseId": "7a6aeb64-4114-11ea-8578-0242ac120006",
             "creationTime": "2020-01-27T18:15:32.862+0000",
             "updateTime": null,
             "taskDefinitionKey": "TaskComment",
             "userId": 3301,
             "message": "Комментарий через REST API",
             "files": null,
             "organizationId": null,
             "evaluateTime": null,
             "evaluate": false,
             "firstName": "Евгений",
             "lastName": "Павлов",
             "authority": "Заявитель"
         },
         {
             "id": 2233,
             "caseId": "7a6aeb64-4114-11ea-8578-0242ac120006",
             "creationTime": "2020-01-27T14:51:19.765+0000",
             "updateTime": null,
             "taskDefinitionKey": "TaskModeration",
             "userId": 3301,
             "message": "Обращение создано и передано на модерацию",
             "files": "[21140ed9-b07c-4d6d-977d-8ecef75fc2c8]",
             "organizationId": null,
             "evaluateTime": "2020-01-27T17:55:11.627+0000",
             "evaluate": true,
             "firstName": "Евгений",
             "lastName": "Павлов",
             "authority": "Заявитель"
         }
     ]
 }
 
 */
