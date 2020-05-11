//
//  VoteTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 11.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class VoteTableViewCell: BaseTableViewCell {

    @IBOutlet weak var votingCellView: VotingCellView!
    
    var data: Vote? {
        didSet {
            votingCellView.surveyNumber.text = data?.id?.description
            votingCellView.surveyNumber.text = data?.message
            votingCellView.endOfVoting.text = data?.date?.string(format: "dd.MM.yyyy")
        }
    }
}
