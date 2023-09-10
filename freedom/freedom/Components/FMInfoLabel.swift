//
//  FMInfoLabel.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 04.09.2023.
//

import UIKit

final class FMInfoLabel: UILabel {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(infoTitle: String, amount: String) {
        self.init(frame: .zero)
        setupLabel(infoTitle: infoTitle, amount: amount)
    }
    
    private func setupLabel(infoTitle: String, amount: String) {
        textAlignment = .center
        textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        font = Fonts.mediumText
        let prefixAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.fmGray,
            .font: Fonts.mediumText
        ]
        let combinedAttributedString = NSMutableAttributedString()
        combinedAttributedString.append(NSAttributedString(string: infoTitle, attributes: prefixAttributes))
        combinedAttributedString.append(.formatString(text: amount, color: .fmGray, font: Fonts.mediumText))
        self.attributedText = combinedAttributedString
    }
}
