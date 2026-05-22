import SlipstreamKit
import SwiftUI

@main
struct SlipstreamApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.locale, AppLocalization.locale)
        }
    }
}
