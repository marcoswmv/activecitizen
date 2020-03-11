//
//  UsersTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class UsersTableViewCell: BaseTableViewCell {

    @IBOutlet weak var subContentView: UIView!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var solvedProblems: UILabel!
    @IBOutlet weak var applications: UILabel!

    var data: User? {
        didSet {
            userPhoto.image = data?.photo
            userName.text = data?.name //"Филинков Александр Юрьевич"
            solvedProblems.text = "\(String(describing: data?.solvedProblems))" // "\(8924)"
            applications.text = "\(String(describing: data?.applications))" // "\(10909)"
        }
    }
}
