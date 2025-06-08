import SwiftUI

struct WinnerView: View {
    let winner: String

    var body: some View {
        VStack(spacing: 20) {
            Text("الفائز هو")
                .font(.largeTitle)
            Text(winner)
                .font(.title)
                .bold()
            Image(systemName: "sparkles")
                .font(.system(size: 80))
                .foregroundColor(Color("Button"))
                .scaleEffect(1.2)
                .animation(.easeInOut.repeatForever(), value: true)
        }
        .padding()
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(winner: "الفريق أ")
    }
}
