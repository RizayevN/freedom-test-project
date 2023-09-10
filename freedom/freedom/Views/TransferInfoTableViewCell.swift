//
//  TransferInfoTableViewCell.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 08.09.2023.
//

import UIKit

struct TransferInfoTableViewModel {
    let icon: UIImage
    let title: String
    let subtitle: String
    let amount: String
    let amountInfo: String
}

final class TransferInfoTableViewCell: BaseTableViewCell {
    
    private let iconView = UIImageView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.mediumParagraph
        label.textColor = .fmBlackText
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularText
        label.textColor = .fmGrayText
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.semiboldParagraph
        label.textAlignment = .right
        return label
    }()
    
    private let amountInfoLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularText
        label.textColor = .fmGrayText
        return label
    }()
    
    private lazy var amountStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [amountLabel, amountInfoLabel])
        stackView.axis = .vertical
        return stackView
    }()
        
    override func setup() {
        setupView()
        self.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        selectionStyle = .none
    }
    
    func configure(viewModel: TransferInfoTableViewModel) {
        iconView.image = viewModel.icon
        titleLabel.text = viewModel.title
        stackView.addArrangedSubview(subtitleLabel)
        subtitleLabel.text = viewModel.subtitle
        amountLabel.attributedText = .formatString(
            text: viewModel.amount,
            color: .fmGrayText,
            font: Fonts.semiboldParagraph
        )
        amountInfoLabel.text = viewModel.amountInfo
    }
    
    private func setupView() {
        backgroundColor = .white
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.left.equalTo(iconView.snp.right).offset(12)
            $0.top.bottom.equalToSuperview().inset(12)
        }
        contentView.addSubview(amountStackView)
        amountStackView.snp.makeConstraints {
            $0.left.equalTo(stackView.snp.right).offset(12)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.top.equalToSuperview().inset(16)
        }
    }
}

