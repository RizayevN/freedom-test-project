//
//  CardInfoTableViewCell.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 06.09.2023.
//

import UIKit

final class CardInfoTableViewCell: BaseTableViewCell {
    
    private let bonusView = FMSquareInfoView()
    private let cardView = FMSquareInfoView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bonusView, cardView])
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    override func setup() {
        setupView()
        selectionStyle = .none
    }
    
    func configure(bonusViewModel: FMSquareInfoViewModel, cardViewModel: FMSquareInfoViewModel) {
        bonusView.configure(viewModel: bonusViewModel)
        cardView.configure(viewModel: cardViewModel)
    }
    
    private func setupView() {
        backgroundColor = .clear
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
    }
}
