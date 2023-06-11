//
//  CupcakeprojctApp.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        //print(db)
        return true
    }
}

@main
struct CupcakeprojctApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LogInView()
        }
    }
}
