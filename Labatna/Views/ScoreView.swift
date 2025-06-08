import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var game: GameViewModel

    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<game.teams.count, id: \.self) { index in
                HStack {
                    Text(game.teams[index])
                        .font(.title3)
                    Spacer()
                    Text("\(game.scores[index])")
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .shadow(radius: 2)
            }
        }
        .padding()
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView().environmentObject(GameViewModel())
    }
}
