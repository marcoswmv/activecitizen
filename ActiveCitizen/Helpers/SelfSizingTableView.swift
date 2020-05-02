//
//  SelfSizingTableView.swift
//  GlambookMaster
//
//  Created by Dmitry Byankin on 05.03.2020.
//  Copyright © 2020 65Apps. All rights reserved.
//

import UIKit

class SelfSizingTableView: UITableView {
    
    @IBInspectable var hideHeadersAndFooters: Bool = false
    @IBInspectable var minHeight: CGFloat = 0
    private var heightConstraint: NSLayoutConstraint?
    

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }


    func setup() {

        translatesAutoresizingMaskIntoConstraints = false
        heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        addConstraint(heightConstraint!)
    }

    override var contentSize: CGSize {
        
        didSet {
            
            if hideHeadersAndFooters {
                var headerPlusFooter: CGFloat = 0
                if tableHeaderView != nil {
                    headerPlusFooter += tableHeaderView?.frame.size.height ?? 0.0
                }

                if tableFooterView != nil {
                    headerPlusFooter += tableFooterView?.frame.size.height ?? 0.0
                }

                if contentSize.height == headerPlusFooter {
                    heightConstraint!.constant = max(0, minHeight)
                } else {
                    heightConstraint!.constant = max(contentSize.height, minHeight)
                }
            } else {
                heightConstraint!.constant = max(contentSize.height, minHeight)
            }
        }
    }

}
