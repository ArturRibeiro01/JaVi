import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()

    var body: some View {
        if viewModel.splashFinished {
            if viewModel.isUserLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        } else {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Já vi")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)
                        .opacity(viewModel.isAnimating ? 1 : 0)
                        .scaleEffect(viewModel.isAnimating ? 1 : 0.8)
                        .animation(.easeOut(duration: 4).delay(0.2), value: viewModel.isAnimating)
                }
            }
            .onAppear {
                viewModel.startAnimationAndCheckLogin()
            }
        }
    }
}

#Preview {
    SplashView()
}
