import Foundation

struct User: Decodable, Identifiable {

    let id: String
    let fullName: String
    let email: String
    let phone: String?
    let wallet: WalletInfo?
    let status: String?
    let kycLevel: String?
    let createdAt: String?
    let updatedAt: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case underscoreId = "_id"
        case fullName
        case email
        case phone
        case walletId
        case status
        case kycLevel
        case createdAt
        case updatedAt
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        let id = try c.decodeIfPresent(String.self, forKey: .id)
        let underscoreId = try c.decodeIfPresent(String.self, forKey: .underscoreId)
        self.id = id ?? underscoreId ?? UUID().uuidString

        self.fullName = try c.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        self.email = try c.decodeIfPresent(String.self, forKey: .email) ?? ""
        self.phone = try c.decodeIfPresent(String.self, forKey: .phone)

        // ✅ FIX: walletId is an OBJECT, not a String
        self.wallet = try c.decodeIfPresent(WalletInfo.self, forKey: .walletId)

        self.status = try c.decodeIfPresent(String.self, forKey: .status)
        self.kycLevel = try c.decodeIfPresent(String.self, forKey: .kycLevel)
        self.createdAt = try c.decodeIfPresent(String.self, forKey: .createdAt)
        self.updatedAt = try c.decodeIfPresent(String.self, forKey: .updatedAt)
    }
}
