//
//  FMProductTitleView.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 05.09.2023.
//

import UIKit

final class FMProductTitleView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularText
        label.text = "Цифровая кредитная карта"
        label.textColor = .white
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .fmApplePay
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, imageView])
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 16
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(23)
        }
    }
}
