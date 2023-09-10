//
//  FMRoundButton.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 04.09.2023.
//

import UIKit

final class FMRoundButton: UIButton {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    convenience init(title: String) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
    }
    
    private func setupUI() {
        layer.cornerRadius = 16
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 32)
        ])
        backgroundColor = .fmGreen
        setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = Fonts.semiboldText
    }
}
