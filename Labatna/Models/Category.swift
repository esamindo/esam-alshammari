import Foundation

struct Category: Identifiable {
    let id = UUID()
    let name: String
    var questions: [Question]
}
