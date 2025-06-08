import SwiftUI

struct MainButton: View {
    let title: String
    var action: (() -> Void)? = nil

    var body: some View {
        Button(action: { action?() }) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("Button"))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
        }
        .buttonStyle(MainButtonStyle())
    }
}

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.8 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
