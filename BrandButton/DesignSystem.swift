//
//  DesignSystem.swift
//  BrandButton
//
//  Created by Ali Elsokary on 30/01/2024.
//

import UIKit

struct DS {
    
    enum Colors {
        
        enum Button {
            static let defaultGreen = UIColor(named: "trvGreen700")!
            static let highlightedGreen = UIColor(named: "trvGreen900")!
            static let backgroundGreen = UIColor(named: "trvGreen100")!

            
            static let defaultBlue = UIColor(named: "trvBlue700")!
            static let highlightedBlue = UIColor(named: "trvBlue900")!
            static let backgroundBlue = UIColor(named: "trvBlue100")!

            static let backgroundDisabled = UIColor(named: "trvJuri300")!
            
            static let neutralsWhite = UIColor(named: "neutralsWhite")!


        }
    }
    
    enum Fonts {
        static let subhead2 = UIFont(name: "ProximaNova-Regular", size: 15.0)
    }
}
