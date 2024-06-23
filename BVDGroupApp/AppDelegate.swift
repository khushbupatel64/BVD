

import GoogleMaps
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .light
                }
                
                
            }
        }
        GMSServices.provideAPIKey("AIzaSyDO0dHeBDBRU1hRM9aTbnQhv-ha-mdAf7g")
        return true
    }
}

