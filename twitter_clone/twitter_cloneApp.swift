//
//  twitter_cloneApp.swift
//  twitter_clone
//
//  Created by Inas Bekkouche on 07/07/2022.
//

import SwiftUI


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    

    return true
  }
}

@main
struct twitter_cloneApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
