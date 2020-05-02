//
//  Status.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 04.04.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

enum Status: String {
    case OnModeration = "На модерации"
    case Rejected = "Отклонено"
    case Closed = "Завершено"
    case Accepted = "Принято в обработку"
    case Done = "Работа выполнена"
    case Unknown = ""
}

struct TaskStatus {
    
    func setStatus (statusKey: String?) -> String {
        switch statusKey {
        case "TaskModeration":
            return Status.OnModeration.rawValue
        case "TaskRejected":
            return Status.Rejected.rawValue
        case "TaskClosed":
            return Status.Closed.rawValue
        case "TaskAcceptance":
            return Status.Accepted.rawValue
        case "TaskEnterResult":
            return Status.Accepted.rawValue
        case "TaskPerformanceEvaluation":
            return Status.Done.rawValue
        default:
            return Status.Unknown.rawValue
        }
    }
    
    func setColor (statusKey: String?) -> UIColor {
        switch statusKey {
        case "TaskModeration":
            return .orange
        case "TaskRejected":
            return UIColor(named: "Gray-Blue")!
        case "TaskClosed":
            return .red
        case "TaskAcceptance":
            return UIColor(named: "App Blue")!
        case "TaskEnterResult":
            return UIColor(named: "App Blue")!
        case "TaskPerformanceEvaluation":
            return UIColor(named: "App Green")!
        default:
            return .black
        }
    }
}
