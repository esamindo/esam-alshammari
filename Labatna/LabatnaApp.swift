import SwiftUI

@main
struct LabatnaApp: App {
    @StateObject private var gameViewModel = GameViewModel()
    @Environment(\.layoutDirection) var layoutDirection

    init() {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(gameViewModel)
        }
    }
}
