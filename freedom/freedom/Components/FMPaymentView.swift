//
//  FMPaymentView.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 05.09.2023.
//

import UIKit

final class FMPaymentView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fmGray
        label.font = Fonts.mediumText
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.semiboldParagraph
        return label
    }()
    
    private let paymentButton = FMRoundButton(title: "Погасить")
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, amountLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Initialization
    init(title: String, amount: String) {
        super.init(frame: .zero)
        layer.cornerRadius = 16
        backgroundColor = .fmBlue
        titleLabel.text = title
        amountLabel.text = amount
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        snp.makeConstraints {
            $0.height.equalTo(72)
        }
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview().inset(16)
        }
        addSubview(paymentButton)
        paymentButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
            $0.width.equalTo(80)
            $0.height.equalTo(32)
        }
    }
}
