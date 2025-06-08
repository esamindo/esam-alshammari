import SwiftUI

struct SettingsView: View {
    @State private var soundOn = true
    @State private var musicOn = true

    var body: some View {
        Form {
            Toggle("الصوت", isOn: $soundOn)
            Toggle("الموسيقى", isOn: $musicOn)
            NavigationLink("الدعم والمساعدة") {
                Text("Coming Soon")
            }
        }
        .navigationTitle("الإعدادات")
        .background(Color("Background"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
