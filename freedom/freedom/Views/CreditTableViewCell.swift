//
//  CreditTableViewCell.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 05.09.2023.
//

import UIKit

struct CreditTableViewModel {
    let title: String
    let available: String
    let maxAmount: String
}

final class CreditTableViewCell: BaseTableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.semiboldParagraph
        label.textColor = .fmBlack
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularText
        label.textColor = .fmGrayText
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setImage(.fmRightArrow, for: .normal)
        return button
    }()

    private let progressView = FMProgressView()
    
    override func setup() {
        setupView()
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        selectionStyle = .none
    }
    
    func configure(viewModel: CreditTableViewModel) {
        titleLabel.text = viewModel.title
        let availableDouble = Double(viewModel.available.cleanString()) ?? 0
        let maxAmountDouble = Double(viewModel.maxAmount.cleanString()) ?? 0
        progressView.progress = availableDouble / maxAmountDouble
        subtitleLabel.text = "Доступно \(viewModel.available) ₸ из \(viewModel.maxAmount) ₸"
    }
    
    private func setupView() {
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .white
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
        }
        contentView.addSubview(button)
        button.snp.makeConstraints {
            $0.centerY.equalTo(stackView)
            $0.right.equalToSuperview().inset(16)
        }
        contentView.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(6)
        }
    }
}
