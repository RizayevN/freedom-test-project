//
//  BaseViews.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 06.09.2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {}
}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath)
                as? T else { fatalError(" table view cell identifier does not exist") }
        return cell
    }
    
    func register(_ cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: "\(cellClass)")
    }
}
