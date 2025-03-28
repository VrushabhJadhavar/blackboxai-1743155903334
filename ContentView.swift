import SwiftUI

struct ContentView: View {
    @State private var showWelcome = true
    
    var body: some View {
        ZStack {
            if showWelcome {
                WelcomeView(showWelcome: $showWelcome)
            } else {
                HomeView()
            }
        }
    }
}