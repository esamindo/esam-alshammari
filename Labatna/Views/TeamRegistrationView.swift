import SwiftUI

struct TeamRegistrationView: View {
    @EnvironmentObject var game: GameViewModel
    @State private var teamA: String = ""
    @State private var teamB: String = ""
    @State private var navigate = false

    var body: some View {
        VStack(spacing: 20) {
            TextField("اسم الفريق أ", text: $teamA)
                .textFieldStyle(.roundedBorder)
            TextField("اسم الفريق ب", text: $teamB)
                .textFieldStyle(.roundedBorder)
            NavigationLink(destination: CategorySelectionView(), isActive: $navigate) {
                EmptyView()
            }
            MainButton(title: "ابدأ اللعبة") {
                game.teams = [teamA.isEmpty ? "الفريق أ" : teamA,
                              teamB.isEmpty ? "الفريق ب" : teamB]
                navigate = true
            }
        }
        .padding()
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}

struct TeamRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        TeamRegistrationView().environmentObject(GameViewModel())
    }
}
