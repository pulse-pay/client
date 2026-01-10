//import Foundation
//
//struct APIResponse<T: Decodable>: Decodable {
//    let success: Bool
//    let data: T?
//    let message: String?
//    let count: Int?
//    let total: Int?
//}
//
//struct User: Decodable, Identifiable {
//    let id: String
//    let fullName: String
//    let email: String
//    let phone: String?
//    let walletId: String?
//    let status: String?
//    let kycLevel: String?
//    let createdAt: Date?
//    let updatedAt: Date?
//
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case underscoreId = "_id"
//        case fullName, email, phone, walletId, status, kycLevel, createdAt, updatedAt
//    }
//
//    init(from decoder: Decoder) throws {
//        let c = try decoder.container(keyedBy: CodingKeys.self)
//        let id = try c.decodeIfPresent(String.self, forKey: .id)
//        let underscoreId = try c.decodeIfPresent(String.self, forKey: .underscoreId)
//        self.id = id ?? underscoreId ?? UUID().uuidString
//        self.fullName = try c.decodeIfPresent(String.self, forKey: .fullName) ?? ""
//        self.email = try c.decodeIfPresent(String.self, forKey: .email) ?? ""
//        self.phone = try c.decodeIfPresent(String.self, forKey: .phone)
//        self.walletId = try c.decodeIfPresent(String.self, forKey: .walletId)
//        self.status = try c.decodeIfPresent(String.self, forKey: .status)
//        self.kycLevel = try c.decodeIfPresent(String.self, forKey: .kycLevel)
//
//        // Timestamps may be strings; decode leniently
//        let iso = ISO8601DateFormatter()
//        if let created = try c.decodeIfPresent(String.self, forKey: .createdAt) {
//            self.createdAt = iso.date(from: created)
//        } else {
//            self.createdAt = nil
//        }
//        if let updated = try c.decodeIfPresent(String.self, forKey: .updatedAt) {
//            self.updatedAt = iso.date(from: updated)
//        } else {
//            self.updatedAt = nil
//        }
//    }
//}
