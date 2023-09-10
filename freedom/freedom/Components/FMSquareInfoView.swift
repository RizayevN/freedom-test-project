//
//  FMSquareInfoView.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 06.09.2023.
//

import UIKit

struct FMSquareInfoViewModel {
    let title: String
    let subtitle: String
    let titleIcon: UIImage?
    let imageView: UIImage
}

final class FMSquareInfoView: UIView {
    
    private let imageView = UIImageView()
    
    private let iconView = UIImageView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.boldParagraph
        label.textColor = .fmBlackText
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularText
        label.textColor = .fmGrayText
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.spacing = 4
        return stackView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: FMSquareInfoViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        imageView.image = viewModel.imageView
        if viewModel.titleIcon != nil {
            stackView.addArrangedSubview(iconView)
            iconView.image = viewModel.titleIcon
        }
    }

    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 16
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(16)
        }
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(16)
        }
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(2)
            $0.left.right.bottom.equalToSuperview().inset(16)
        }
        iconView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
    }
}
