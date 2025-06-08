import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var teams: [String] = ["الفريق أ", "الفريق ب"]
    @Published var selectedCategories: [Category] = []
    @Published var currentQuestion: Question?
    @Published var scores: [Int] = [0, 0]
    @Published var showHome: Bool = false

    let allCategories: [Category] = [
        Category(name: "رياضة", questions: []),
        Category(name: "تاريخ", questions: []),
        Category(name: "علوم", questions: []),
        Category(name: "جغرافيا", questions: []),
        Category(name: "أدب", questions: []),
        Category(name: "فن", questions: []),
        Category(name: "تكنولوجيا", questions: []),
        Category(name: "أفلام", questions: []),
        Category(name: "موسيقى", questions: []),
        Category(name: "متفرقات", questions: [])
    ]

    func startGame() {
        scores = [0, 0]
        currentQuestion = nil
    }

    func selectCategory(_ category: Category) {
        if selectedCategories.count < 6 {
            selectedCategories.append(category)
        }
    }

    func nextQuestion() {
        guard let category = selectedCategories.randomElement() else { return }
        guard let question = category.questions.randomElement() else { return }
        currentQuestion = question
    }

    func answerQuestion(correct: Bool, value: Int, teamIndex: Int) {
        if correct {
            scores[teamIndex] += value
        } else {
            scores[teamIndex] -= value
        }
    }
}
