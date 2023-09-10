//
//  CardInfoHeaderView.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 05.09.2023.
//

import UIKit

final class CardInfoHeaderView: UIView {
    
    private let amountLabel = FMAmountLabel(title: "118 395,95")
    private let infoLabel = FMInfoLabel(infoTitle: "Мои средства: ", amount: "0 ₸")
    private let creditInfoLabel = FMInfoLabel(infoTitle: "|  Кредитные: ", amount: "138 379,95 ₸")
    private let inprogressLabel = FMInfoLabel(infoTitle: "В обработке: ", amount: "20 000,00 ₸")
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [infoLabel, creditInfoLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var actionsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [actionView, transferView, paymentView, calendarView])
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let actionView = FMActionView(title: "Пополнить", image: .fmCard)
    private let transferView = FMActionView(title: "Перевод", image: .fmTransfer)
    private let paymentView = FMActionView(title: "Платеж", image: .fmTenge)
    private let calendarView = FMActionView(title: "Календарь", image: .fmCalendar)
    private let paymentCreditView = FMPaymentView(title: "Внесите платеж до 20 сентября", amount: "15 000 ₸")
    private let productTitleView = FMProductTitleView()
    
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 16
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(amountLabel)
        amountLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(32)
            $0.centerX.equalToSuperview()
        }
        
        addSubview(infoStackView)
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(amountLabel.snp.bottom).offset(8)
            $0.height.equalTo(18)
            $0.centerX.equalToSuperview()
        }
        
        addSubview(inprogressLabel)
        inprogressLabel.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(8)
            $0.height.equalTo(18)
            $0.centerX.equalToSuperview()
        }
        
        scrollView.addSubview(actionsStackView)
        actionsStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(88)
        }

        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(inprogressLabel.snp.bottom).offset(32)
            $0.left.equalToSuperview().inset(16)
            $0.height.equalTo(88)
            $0.right.equalToSuperview()
        }
        
        addSubview(paymentCreditView)
        paymentCreditView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        addSubview(productTitleView)
        productTitleView.snp.makeConstraints {
            $0.top.equalTo(paymentCreditView.snp.bottom).offset(24)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(18)
        }
    }
    
    func calculateCardInfoHeaderViewHeight() -> CGFloat {
        let amountLabelHeight = amountLabel.frame.height
        let infoStackViewHeight = infoStackView.frame.height
        let inprogressLabelHeight = inprogressLabel.frame.height
        let scrollViewHeight = scrollView.frame.height
        let paymentCreditViewHeight = paymentCreditView.frame.height
        let productTitleViewHeight = productTitleView.frame.height

        // You might need to account for any additional spacing or insets that aren't included in the frames.

        let totalHeight = amountLabelHeight + infoStackViewHeight + inprogressLabelHeight + scrollViewHeight + paymentCreditViewHeight + productTitleViewHeight + 200

        return totalHeight
    }
}
 
