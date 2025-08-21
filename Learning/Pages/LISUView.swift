//
//  LISUView.swift
//  Learning
//
//  Created by Utsav Gautam on 28/05/25.
//

import SwiftUI

struct LISUView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Button("Login") {
                path.append("login")
            }
            .buttonStyle(.borderedProminent)

            Button("Sign Up") {
                path.append("signup")
            }
            .buttonStyle(.bordered)
        }
        .navigationTitle("Welcome")
    }
}
