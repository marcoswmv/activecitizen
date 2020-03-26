//
//  SementedControl+MaterialPreset.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 16.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import RESegmentedControl

//TO DO: Make my own preset to be more reusable

extension MaterialPreset {
    mutating func configure() {
        self.segmentItemStyle.textColor = .black
        self.segmentItemStyle.tintColor = .black
        self.segmentItemStyle.font = .systemFont(ofSize: 15, weight: .regular)
        
        self.segmentSelectedItemStyle.size = .height(3, position: .bottom)
    }
}
