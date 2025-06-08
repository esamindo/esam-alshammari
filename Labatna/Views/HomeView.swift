import SwiftUI

struct HomeView: View {
    @EnvironmentObject var game: GameViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    NavigationLink(destination: TeamRegistrationView()) {
                        MainButton(title: "العب الآن")
                    }
                    NavigationLink(destination: ScoreView()) {
                        MainButton(title: "الفرق")
                    }
                    NavigationLink(destination: ScoreView()) {
                        MainButton(title: "المركز")
                    }
                    NavigationLink(destination: SettingsView()) {
                        MainButton(title: "الإعدادات")
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(GameViewModel())
    }
}
