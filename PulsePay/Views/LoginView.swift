import SwiftUI

struct LoginView: View {

    @ObservedObject var vm: AuthViewModel
    let onAuthenticated: (User) -> Void
    let onSwitchToSignUp: () -> Void

    var body: some View {
        VStack(spacing: 14) {

            VStack(alignment: .leading, spacing: 10) {
                Text("Email")
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)
                HStack(spacing: 10) {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(AppColors.textMutedOnDark)
                    TextField("you@example.com", text: $vm.loginEmail)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .foregroundColor(AppColors.textOnDark)
                }
                .padding()
                .background(Color.white.opacity(0.06))
                .cornerRadius(12)

                Text("Password")
                    .font(.caption)
                    .foregroundColor(AppColors.textMutedOnDark)
                HStack(spacing: 10) {
                    Image(systemName: "lock.fill")
                        .foregroundColor(AppColors.textMutedOnDark)
                    SecureField("••••••••", text: $vm.loginPassword)
                        .textContentType(.password)
                        .foregroundColor(AppColors.textOnDark)
                }
                .padding()
                .background(Color.white.opacity(0.06))
                .cornerRadius(12)
            }

            if let error = vm.errorMessage, !error.isEmpty {
                Text(error)
                    .font(.caption)
                    .foregroundColor(AppColors.negative)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Button {
                Task {
                    await vm.performLogin { user in
                        onAuthenticated(user)
                    }
                }
            } label: {
                HStack {
                    if vm.isLoading {
                        ProgressView().tint(.black)
                    }
                    Text("Sign In")
                        .font(.headline)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(vm.isLoginFormValid ? AppColors.positive : AppColors.positive.opacity(0.5))
                .cornerRadius(12)
            }
            .disabled(!vm.isLoginFormValid || vm.isLoading)
            .padding(.top, 6)

            Button(action: onSwitchToSignUp) {
                HStack(spacing: 4) {
                    Text("New to PulsePay?")
                        .foregroundColor(AppColors.textMutedOnDark)
                    Text("Create an account")
                        .foregroundColor(AppColors.accentBlue)
                        .bold()
                }
                .font(.caption)
                .padding(.top, 4)
            }
        }
    }
}
