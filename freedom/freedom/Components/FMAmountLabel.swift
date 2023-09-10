//
//  FMAmountLabel.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 04.09.2023.
//

import UIKit

final class FMAmountLabel: UILabel {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        setupLabel(title: title)
    }
    
    private func setupLabel(title: String) {
        textAlignment = .center
        textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        font = Fonts.heading1
        self.attributedText = .formatString(text: title, color: .fmGray, font: Fonts.heading2)
    }
}
