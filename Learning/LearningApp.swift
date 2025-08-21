//
//  LearningApp.swift
//  Learning
//
//  Created by Utsav Gautam on 25/05/25.
//

import SwiftUI
import Firebase

@main
struct LearningApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(Color(red: 35/255, green: 209/255, blue: 163/255))

        }
    }
}
