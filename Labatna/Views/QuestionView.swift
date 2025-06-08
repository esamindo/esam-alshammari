import SwiftUI

struct QuestionView: View {
    let category: Category
    let value: Int
    @EnvironmentObject var game: GameViewModel
    @State private var showAnswer = false
    @State private var answerCorrect = false
    @State private var teamIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            Text(category.name)
                .font(.title2)
            Text("\(value)")
                .font(.headline)
            if let question = game.currentQuestion {
                Text(question.text)
                    .multilineTextAlignment(.center)
            }
            HStack {
                ForEach(0..<game.teams.count, id: \.self) { index in
                    Button(game.teams[index]) {
                        teamIndex = index
                        showAnswer = true
                    }
                    .buttonStyle(MainButtonStyle())
                }
            }
        }
        .padding()
        .background(Color("Background").edgesIgnoringSafeArea(.all))
        .onAppear {
            game.nextQuestion()
        }
        .sheet(isPresented: $showAnswer) {
            AnswerRevealView(value: value, teamIndex: teamIndex)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(category: Category(name: "اختبار", questions: []), value: 200)
            .environmentObject(GameViewModel())
    }
}
