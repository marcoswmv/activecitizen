//
//  BaseTableViewCell.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    class var identifier: String {
        get {
            return String(describing: self)
        }
    }

    /*
    -(void)setSelected:(BOOL)selected {
         if(!self.fadeHighlight){
             [super setSelected:selected];
         }
    }

    -(void)setSelected:(BOOL)selected animated:(BOOL)animated {
        if(!self.fadeHighlight){
            [super setSelected:selected animated:animated];
        }
    }

    -(void)setHighlighted:(BOOL)highlighted {
        if(!self.fadeHighlight){
            [super setHighlighted:highlighted];
        }else{
            self.alpha = highlighted ? 0.5f : 1.f;
        }
    }

    -(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
        if(!self.fadeHighlight){
            [super setHighlighted:highlighted animated:animated];
        }else{
            
            if(animated){
                [UIView animateWithDuration:0.3f animations:^{
                    self.alpha = highlighted ? 0.5f : 1.f;
                }];
            }else{
                self.alpha = highlighted ? 0.5f : 1.f;
            }
        }
    }
     */
}
