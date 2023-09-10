//
//  ViewController.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 04.09.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let button = FMRoundButton(title: "Account")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(180)
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        let viewController = FMCardViewController(transferService: TransferService())
        navigationController?.pushViewController(viewController, animated: false)
    }
}
