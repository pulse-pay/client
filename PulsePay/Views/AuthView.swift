import SwiftUI

struct AuthView: View {

    enum Mode: String, CaseIterable, Identifiable {
        case login = "Login"
        case signup = "Sign Up"
        var id: String { rawValue }
    }

    @StateObject private var vm = AuthViewModel()
    @State private var mode: Mode = .login

    let onAuthenticated: (User) -> Void

    var body: some View {
        ZStack {
            AppColors.darkBG.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {

                    Spacer().frame(height: 24)

                    // Branding
                    Image("Applogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(.top, 16)
                        .shadow(radius: 6)

                    Text("PulsePay")
                        .font(.title.bold())
                        .foregroundColor(AppColors.textOnDark)

                    Text("Sign in to continue")
                        .font(.caption)
                        .foregroundColor(AppColors.textMutedOnDark)

                    // Mode picker
                    Picker("Mode", selection: $mode) {
                        ForEach(Mode.allCases) { m in
                            Text(m.rawValue).tag(m)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)

                    // Forms
                    if mode == .login {
                        LoginView(
                            vm: vm,
                            onAuthenticated: onAuthenticated,
                            onSwitchToSignUp: { withAnimation { mode = .signup } }
                        )
                    } else {
                        SignUpView(
                            vm: vm,
                            onAuthenticated: onAuthenticated,
                            onSwitchToLogin: { withAnimation { mode = .login } }
                        )
                    }

                    Spacer(minLength: 40)
                }
                .padding(.horizontal)
            }
        }
    }
}
