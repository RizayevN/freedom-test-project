//
//  TransferService.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 09.09.2023.
//

import Foundation

protocol TransferServiceProtocol: AnyObject {
    func getTransferHistory(_ callBack: @escaping ([TransferInfoTableViewModel]) -> Void)
}

final class TransferService: TransferServiceProtocol {

    func getTransferHistory(_ callBack: @escaping ([TransferInfoTableViewModel]) -> Void) {
        let transferHistory: [TransferInfoTableViewModel] = [
            .init(icon: .fmTransferIcon, title: "Мама", subtitle: "Перевод", amount: "-1 500,00 ₸", amountInfo: "Freepay Card · Займ"),
            .init(icon: .fmMagnum, title: "Magnum", subtitle: "Покупка", amount: "-2000,00 ₸", amountInfo: "Freepay Card · Займ"),
            .init(icon: .fmCoffee, title: "Starbucks", subtitle: "Покупка", amount: "-6 995,00 ₸", amountInfo: "Freepay Card · Займ")
        ]
        callBack(transferHistory)
    }
}
