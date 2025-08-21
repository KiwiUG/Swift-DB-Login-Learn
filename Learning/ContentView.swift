//
//  ContentView.swift
//  Learning
//
//  Created by Utsav Gautam on 25/05/25.
//

import SwiftUI
import FirebaseAuth

enum AuthScreen: Hashable {
    case login, signup
}

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var isCheckingAuth = true
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            if isCheckingAuth {
                LoadingView()
            } else if isLoggedIn {
                RecentMessagesView(isLoggedIn: $isLoggedIn, path: $path)
                } else {
                LISUView(path: $path)
                    .navigationDestination(for: String.self) { value in
                        switch value {
                        case "login":
                            LoginView(isLoggedIn: $isLoggedIn, path: $path)
                        case "signup":
                            SignupView(isLoggedIn: $isLoggedIn, path: $path)
                        default:
                            EmptyView()
                        }
                    }
            }
        }
        .onAppear {
            checkAuthStatus()
        }
    }

    func checkAuthStatus() {
            isLoggedIn = (Auth.auth().currentUser != nil)
            isCheckingAuth = false
            if isLoggedIn {
                path.removeLast(path.count)  // clear nav stack on start if logged in
            }
        }
}
