//
//  HeaderTableViewCell.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 09.09.2023.
//

import UIKit

struct HeaderViewModel {
    let title: String
    let buttonTitle: String?
    
    init(title: String, buttonTitle: String? = nil) {
        self.title = title
        self.buttonTitle = buttonTitle
    }
}

final class HeaderTableViewCell: BaseTableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.mediumText
        label.textColor = .fmGrayText
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.fmGreen, for: .normal)
        button.titleLabel?.font = Fonts.semiboldButton
        return button
    }()
    
    override func setup() {
        setupView()
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        selectionStyle = .none
    }
    
    func configure(viewModel: HeaderViewModel) {
        titleLabel.text = viewModel.title
        guard viewModel.buttonTitle != nil else { return }
        button.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    private func setupView() {
        backgroundColor = .white
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview().inset(6)
        }
        contentView.addSubview(button)
        button.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6)
            $0.right.equalToSuperview().offset(-16)
        }
    }
}
