//
//  FMActionView.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 04.09.2023.
//

import UIKit

final class FMActionView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.mediumText
        label.textColor = .white
        return label
    }()
    
    // MARK: - Initialization
    init(title: String, image: UIImage?) {
        super.init(frame: .zero)
        setupUI()
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
        titleLabel.text = title
        layer.cornerRadius = 16
        backgroundColor = .fmBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        self.snp.makeConstraints {
            $0.height.equalTo(88)
            $0.width.equalTo(114)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
            make.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
