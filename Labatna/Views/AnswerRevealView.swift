import SwiftUI

struct AnswerRevealView: View {
    @EnvironmentObject var game: GameViewModel
    @Environment(\.dismiss) var dismiss
    let value: Int
    let teamIndex: Int
    @State private var correct = false

    var body: some View {
        VStack(spacing: 20) {
            if let question = game.currentQuestion {
                Text("الإجابة الصحيحة: \(question.answer)")
                Toggle("إجابة صحيحة؟", isOn: $correct)
                    .toggleStyle(SwitchToggleStyle(tint: Color("Button")))
            }
            Button("تأكيد") {
                game.answerQuestion(correct: correct, value: value, teamIndex: teamIndex)
                dismiss()
            }
            .buttonStyle(MainButtonStyle())
        }
        .padding()
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}

struct AnswerRevealView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRevealView(value: 200, teamIndex: 0).environmentObject(GameViewModel())
    }
}
