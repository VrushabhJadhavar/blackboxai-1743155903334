import SwiftUI

struct WelcomeView: View {
    @Binding var showWelcome: Bool
    @State private var opacity: Double = 0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Text("PEAK")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.white)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        opacity = 1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.easeOut(duration: 1.5)) {
                            opacity = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            showWelcome = false
                        }
                    }
                }
        }
    }
}