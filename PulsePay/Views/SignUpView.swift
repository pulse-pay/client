import SwiftUI

struct SignUpView: View {

    @ObservedObject var vm: AuthViewModel
    let onAuthenticated: (User) -> Void
    let onSwitchToLogin: () -> Void

    var body: some View {
        VStack(spacing: 14) {

            Group {
                labeledField(
                    label: "Full Name",
                    systemImage: "person.fill",
                    text: $vm.fullName,
                    keyboard: .default,
                    contentType: .name
                )

                labeledField(
                    label: "Email",
                    systemImage: "envelope.fill",
                    text: $vm.email,
                    keyboard: .emailAddress,
                    contentType: .emailAddress
                )

                labeledField(
                    label: "Phone",
                    systemImage: "phone.fill",
                    text: $vm.phone,
                    keyboard: .phonePad,
                    contentType: .telephoneNumber
                )

                secureLabeledField(
                    label: "Password",
                    systemImage: "lock.fill",
                    text: $vm.password
                )

                secureLabeledField(
                    label: "Confirm Password",
                    systemImage: "lock.fill",
                    text: $vm.confirmPassword
                )
            }

            if let error = vm.errorMessage, !error.isEmpty {
                Text(error)
                    .font(.caption)
                    .foregroundColor(AppColors.negative)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Button {
                Task {
                    await vm.performSignUp { user in
                        onAuthenticated(user)
                    }
                }
            } label: {
                HStack {
                    if vm.isLoading {
                        ProgressView().tint(.black)
                    }
                    Text("Create Account")
                        .font(.headline)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(vm.isSignUpFormValid ? AppColors.positive : AppColors.positive.opacity(0.5))
                .cornerRadius(12)
            }
            .disabled(!vm.isSignUpFormValid || vm.isLoading)
            .padding(.top, 6)

            Button(action: onSwitchToLogin) {
                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .foregroundColor(AppColors.textMutedOnDark)
                    Text("Sign in")
                        .foregroundColor(AppColors.accentBlue)
                        .bold()
                }
                .font(.caption)
                .padding(.top, 4)
            }
        }
    }

    @ViewBuilder
    private func labeledField(label: String,
                              systemImage: String,
                              text: Binding<String>,
                              keyboard: UIKeyboardType,
                              contentType: UITextContentType) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
                .font(.caption)
                .foregroundColor(AppColors.textMutedOnDark)
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .foregroundColor(AppColors.textMutedOnDark)
                TextField(label, text: text)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(keyboard)
                    .textContentType(contentType)
                    .foregroundColor(AppColors.textOnDark)
            }
            .padding()
            .background(Color.white.opacity(0.06))
            .cornerRadius(12)
        }
    }

    @ViewBuilder
    private func secureLabeledField(label: String,
                                    systemImage: String,
                                    text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
                .font(.caption)
                .foregroundColor(AppColors.textMutedOnDark)
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .foregroundColor(AppColors.textMutedOnDark)
                SecureField(label, text: text)
                    .textContentType(.newPassword)
                    .foregroundColor(AppColors.textOnDark)
            }
            .padding()
            .background(Color.white.opacity(0.06))
            .cornerRadius(12)
        }
    }
}
