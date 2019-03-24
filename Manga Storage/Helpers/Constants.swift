//
//  Constants.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 21/03/19.
//  Copyright © 2019 Thiago Augusto. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialColorScheme

struct Constants{
    struct Colors{
        static let PrimaryColor = UIColor.black
        static let Secundaryolor = UIColor.white
        static let PrimaryTextColor = UIColor.gray
        static let ErrorColor = UIColor.red
    }
}


fileprivate var _colorScheme : MDCSemanticColorScheme!
var ColorScheme : MDCSemanticColorScheme {
    get{
        if _colorScheme == nil {
            _colorScheme = MDCSemanticColorScheme()
            
            _colorScheme.primaryColor = UIColor(red:0.25, green:0.32, blue:0.71, alpha:1.0)
            _colorScheme.primaryColorVariant = UIColor(red:0.19, green:0.25, blue:0.62, alpha:1.0)
            _colorScheme.secondaryColor = UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0)
            _colorScheme.errorColor = UIColor(red:0.69, green:0.00, blue:0.13, alpha:1.0)
            _colorScheme.surfaceColor = UIColor(red:0.77, green:0.79, blue:0.91, alpha:1.0)
            _colorScheme.backgroundColor = .white
            
            _colorScheme.onPrimaryColor = .white
            _colorScheme.onSecondaryColor = UIColor(red:0.46, green:0.46, blue:0.46, alpha:1.0)
            _colorScheme.onBackgroundColor = UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.0)
            _colorScheme.onSurfaceColor = UIColor(red:0.74, green:0.74, blue:0.74, alpha:1.0)
        }
        return _colorScheme
    }
}
