import SwiftUI

extension Color {
    static let appBackground = Color(red: 0.93, green: 0.90, blue: 0.85)
    static let buttonColor = Color(red: 0.0, green: 0.45, blue: 0.3)
}
extension Color {
    init(_ name: String) {
        switch name {
        case "Background": self = .appBackground
        case "Button": self = .buttonColor
        default: self = Color(name)
        }
    }
}
