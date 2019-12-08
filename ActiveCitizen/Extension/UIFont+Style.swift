//
//  UIFont+Style.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension UIFont {
    
    open class var regularFontFmily: String {
        get {
            //return UIFont.systemFont(ofSize: 16, weight: .regular).fontName
            return "GothamPro";
        }
    }
    
    open class var boldFontFmily: String {
        get {
            //return UIFont.systemFont(ofSize: 16, weight: .bold).fontName
            return "GothamPro-Medium";
        }
    }
    
    open class var italicFontFmily: String {
        get {
            //return UIFont.italicSystemFont(ofSize: 16).fontName
            return "GothamPro-MediumItalic";
        }
    }

}
