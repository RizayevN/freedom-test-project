//
//  TransferTableViewCell.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 06.09.2023.
//

import UIKit

enum ControlType {
    case switcher
    case arrow
}

struct TransferTableViewModel {
    let image: UIImage
    let title: String
    let subtitle: String?
    let controlType: ControlType?
    
    init(image: UIImage, title: String, subtitle: String? = nil, controlType: ControlType? = .arrow) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.controlType = controlType
    }
}

final class TransferTableViewCell: BaseTableViewCell {
    
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
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    private let switcher = UISwitch()
    
    private let buttonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .fmArrow
        return imageView
    }()
        
    override func setup() {
        setupViews()
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
    func configure(viewModel: TransferTableViewModel) {
        iconView.image = viewModel.image
        titleLabel.text = viewModel.title
        if viewModel.controlType == .switcher {
            switcher.isHidden = false
            buttonImageView.isHidden = true
        } else {
            switcher.isHidden = true
            buttonImageView.isHidden = false
        }
        guard viewModel.subtitle != nil else { return }
        stackView.addArrangedSubview(subtitleLabel)
        subtitleLabel.text = viewModel.subtitle
    }
    
    private func setupViews() {
        switcher.isHidden = true
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
        contentView.addSubview(switcher)
        switcher.snp.makeConstraints {
            $0.left.equalTo(stackView.snp.right).offset(12)
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
        contentView.addSubview(buttonImageView)
        buttonImageView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
    }
}

