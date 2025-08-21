//
//  LoginView.swift
//  Learning
//
//  Created by Utsav Gautam on 26/05/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var path: NavigationPath

    @State private var email = ""
    @State private var password = ""

    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isSuccessAlert = false

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Login Information")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                }

                Section {
                    Button("Login") {
                        LoginHandler.handleLogin(email: email, password: password) { result in
                            switch result {
                            case .success:
                                alertMessage = "Login successful!"
                                isSuccessAlert = true
                            case .failure(let error):
                                alertMessage = error.localizedDescription
                                isSuccessAlert = false
                            }
                            showAlert = true
                        }
                    }
                }
            }
        }
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") {
                if isSuccessAlert {
                    isLoggedIn = true
                    path.removeLast(path.count) // ← This clears back stack to go to dashboard
                }
            }
        }
    }
}
