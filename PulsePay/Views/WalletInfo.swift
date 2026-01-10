//
//  WalletInfo.swift
//  PulsePay
//
//  Created by Anindya Mukhopadhyay on 11/01/26.
//

import Foundation

struct WalletInfo: Decodable, Identifiable {

    let id: String
    let balance: Double
    let currency: String
    let status: String
    let availableBalance: Double?

    private enum CodingKeys: String, CodingKey {
        case id
        case underscoreId = "_id"
        case balance
        case currency
        case status
        case availableBalance
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        let id = try c.decodeIfPresent(String.self, forKey: .id)
        let underscoreId = try c.decodeIfPresent(String.self, forKey: .underscoreId)
        self.id = id ?? underscoreId ?? UUID().uuidString

        self.balance = try c.decodeIfPresent(Double.self, forKey: .balance) ?? 0
        self.currency = try c.decodeIfPresent(String.self, forKey: .currency) ?? "INR"
        self.status = try c.decodeIfPresent(String.self, forKey: .status) ?? "ACTIVE"
        self.availableBalance = try c.decodeIfPresent(Double.self, forKey: .availableBalance)
    }
}
