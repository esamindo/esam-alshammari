import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let value: Int
    let imageName: String?
    let answer: String
}
