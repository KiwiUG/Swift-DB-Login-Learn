//
//  Login.swift
//  Learning
//
//  Created by Utsav Gautam on 26/05/25.
//

import FirebaseAuth

struct LoginHandler {
    static func handleLogin(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
