import SwiftUI

struct CategorySelectionView: View {
    @EnvironmentObject var game: GameViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 20) {
                ForEach(game.allCategories) { category in
                    CategoryCard(category: category)
                        .onTapGesture {
                            game.selectCategory(category)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(game.selectedCategories.contains(where: { $0.id == category.id }) ? Color("Button") : Color.clear, lineWidth: 3)
                        )
                }
            }
            .padding()
        }
        .navigationTitle("اختر الفئات (\(game.selectedCategories.count)/6)")
        .toolbar {
            NavigationLink(destination: GameBoardView()) {
                Text("التالي")
                    .bold()
            }.disabled(game.selectedCategories.count < 6)
        }
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}

struct CategoryCard: View {
    let category: Category

    var body: some View {
        VStack {
            Image(systemName: "questionmark")
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .foregroundColor(Color("Button"))
            Text(category.name)
                .font(.headline)
                .foregroundColor(Color("Button"))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct CategorySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategorySelectionView().environmentObject(GameViewModel())
        }
    }
}
