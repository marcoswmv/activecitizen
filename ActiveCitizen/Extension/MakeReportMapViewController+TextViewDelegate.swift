//
//  MakeReportMapViewController+TextViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension MakeReportMapViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Текст сообщения"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count

        maxLength.text = "\(numberOfChars) / 1000"
        return numberOfChars < 1000;
    }
}
