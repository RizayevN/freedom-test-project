//
//  FMFonts.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 05.09.2023.
//

import UIKit

enum Font: String, CaseIterable {
    case bold = "SFProDisplay-Bold"
    case medium = "SFProDisplay-Medium"
    case regular = "SFProDisplay-Regular"
    case semibold = "SFProDisplay-Semibold"
}

extension UIFont {
    convenience init(type: Font, size: CGFloat) {
        self.init(name: type.rawValue, size: size)!
    }
}

enum Fonts {
    static let heading1 = UIFont(type: .bold, size: 32)
    static let heading2 = UIFont(type: .bold, size: 22)
    
    static let mediumText = UIFont(type: .medium, size: 13)
    static let regularText = UIFont(type: .regular, size: 13)
    static let semiboldText = UIFont(type: .semibold, size: 13)
    
    static let semiboldParagraph = UIFont(type: .semibold, size: 16)
    static let mediumParagraph = UIFont(type: .medium, size: 16)
    static let boldParagraph = UIFont(type: .bold, size: 16)
    
    static let semiboldButton = UIFont(type: .semibold, size: 14)
}
