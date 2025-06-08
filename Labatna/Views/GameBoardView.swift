import SwiftUI

struct GameBoardView: View {
    @EnvironmentObject var game: GameViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: game.selectedCategories.count), spacing: 10) {
                ForEach(game.selectedCategories) { category in
                    VStack {
                        Text(category.name)
                            .font(.headline)
                        ForEach([200, 400, 800, 1600], id: \.self) { value in
                            NavigationLink(destination: QuestionView(category: category, value: value)) {
                                Text("\(value)")
                                    .frame(maxWidth: .infinity)
                                    .padding(8)
                                    .background(Color("Button"))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.vertical, 2)
                            }
                        }
                    }
                    .padding(5)
                }
            }
            .padding()
        }
        .navigationTitle("لوحة اللعب")
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameBoardView().environmentObject(GameViewModel())
        }
    }
}
