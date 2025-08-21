//
//  DashBoard.swift
//  Learning
//
//  Created by Utsav Gautam on 28/05/25.
//

import FirebaseAuth

class Dashboard {
    func logout(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            print("Firebase signOut succeeded")
            completion(true)
        } catch {
            print("Error during logout: \(error.localizedDescription)")
            completion(false)
        }
    }
}
