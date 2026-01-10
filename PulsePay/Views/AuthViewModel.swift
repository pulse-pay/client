import Foundation
import SwiftUI
import Combine

@MainActor
final class AuthViewModel: ObservableObject {

    // Login form
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""

    // Sign up form
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    // State
    @Published var isLoading = false
    @Published var errorMessage: String?

    // Validation
    var isLoginFormValid: Bool {
        isValidEmail(loginEmail) && loginPassword.count >= 6
    }

    var isSignUpFormValid: Bool {
        !fullName.trimmingCharacters(in: .whitespaces).isEmpty &&
        isValidEmail(email) &&
        isValidPhone(phone) &&
        password.count >= 6 &&
        password == confirmPassword
    }

    func performLogin(onSuccess: @escaping (User) -> Void) async {
        guard isLoginFormValid else { return }
        errorMessage = nil
        isLoading = true
        defer { isLoading = false }

        do {
            let user = try await AuthService.shared.login(email: loginEmail, password: loginPassword)
            onSuccess(user)
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
        }
    }

    func performSignUp(onSuccess: @escaping (User) -> Void) async {
        guard isSignUpFormValid else { return }
        errorMessage = nil
        isLoading = true
        defer { isLoading = false }

        do {
            let user = try await AuthService.shared.signUp(fullName: fullName,
                                                           email: email,
                                                           phone: phone,
                                                           password: password)
            onSuccess(user)
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
        }
    }

    // MARK: - Helpers
    private func isValidEmail(_ value: String) -> Bool {
        let regex = #"(?:[A-Z0-9a-z._%+-]+)@(?:[A-Za-z0-9-]+\.)+[A-Za-z]{2,64}"#
        return value.range(of: regex, options: .regularExpression) != nil
    }

    private func isValidPhone(_ value: String) -> Bool {
        // Lightweight phone validation (7-15 digits)
        let digits = value.filter(\.isNumber)
        return digits.count >= 7 && digits.count <= 15
    }
}
