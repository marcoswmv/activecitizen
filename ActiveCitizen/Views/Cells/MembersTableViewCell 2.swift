//
//  UsersTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class MembersTableViewCell: BaseTableViewCell {

    @IBOutlet weak var subContentView: UIView!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var solvedProblems: UILabel!
    @IBOutlet weak var applications: UILabel!

    var data: Member? {
        didSet {
            userPhoto.image = data?.photo
            userName.text = data?.name
            solvedProblems.text = "\(data?.solvedProblems ?? 0)"
            applications.text = "\(data?.activeApplications ?? 0)"
        }
    }
}
