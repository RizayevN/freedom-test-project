//
//  Helpers.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 04.09.2023.
//

import UIKit

extension NSAttributedString {
    static func formatString(text: String, color: UIColor, font: UIFont?) -> NSAttributedString {
        let parts = text.split(separator: ",")
        let attributedString = NSMutableAttributedString(string: text)
        if parts.count == 2 {
            let range = NSRange(location: parts[0].count, length: parts[1].count+1)
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
            attributedString.addAttribute(.font, value: font ?? .systemFont(ofSize: 16), range: range)
        }
        return attributedString
    }
}
