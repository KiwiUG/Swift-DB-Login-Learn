//
//  SignUp.swift
//  Learning
//
//  Created by Utsav Gautam on 26/05/25.
//

import FirebaseAuth
import FirebaseFirestore

struct SignupHandler {
    
    static func saveUserToFirestore(uid: String, username: String, email: String) {
        let db = Firestore.firestore()
        db.collection("users").document(uid).setData([
            "username": username,
            "email": email,
            "createdAt": Timestamp()
        ]) { error in
            if let error = error {
                print("Error saving user: \(error)")
            } else {
                print("User saved to Firestore")
            }
        }
    }

    
    static func handleSignup(
        username: String,
        email: String,
        password: String,
        confirmPassword: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        guard password == confirmPassword else {
            completion(.failure(NSError(domain: "", code: 400, userInfo: [
                NSLocalizedDescriptionKey: "Passwords do not match"
            ])))
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let uid = authResult?.user.uid {
                SignupHandler.saveUserToFirestore(uid: uid, username: username, email: email)
                completion(.success(()))
            }
        }

        }
    }

