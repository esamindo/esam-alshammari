import SwiftUI

struct SplashView: View {
    @State private var animate = false
    @EnvironmentObject var game: GameViewModel

    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "sparkles")
                    .font(.system(size: 80))
                    .foregroundColor(Color("Button"))
                    .opacity(animate ? 1 : 0)
                    .scaleEffect(animate ? 1 : 0.5)
                    .animation(.easeOut(duration: 1), value: animate)
                Text("لعبتنا")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("Button"))
                    .opacity(animate ? 1 : 0)
                    .animation(.easeOut(duration: 1.5), value: animate)
            }
        }
        .onAppear {
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                game.showHome = true
            }
        }
        .fullScreenCover(isPresented: $game.showHome) {
            HomeView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView().environmentObject(GameViewModel())
    }
}
