//
//  String+.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 08.09.2023.
//

import Foundation

extension String {
    func cleanString() -> String {
        replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: ".")
    }
}
