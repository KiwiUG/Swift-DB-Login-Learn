//
//  RecentMessages.swift
//  Learning
//
//  Created by Utsav Gautam on 28/05/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class RecentMessages: ObservableObject {
    @Published var recentMessages: [Message] = []
    private var listener: ListenerRegistration?

    func startListening() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()

        listener = db.collection("messages")
            .whereField("senderId", isEqualTo: userId)
            .order(by: "timestamp", descending: true)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else { return }

                self.recentMessages = documents.compactMap { doc in
                    let data = doc.data()
                    return Message(
                        id: doc.documentID,
                        senderId: data["senderId"] as? String ?? "",
                        receiverId: data["receiverId"] as? String ?? "",
                        text: data["text"] as? String ?? "",
                        timestamp: (data["timestamp"] as? Timestamp)?.dateValue() ?? Date()
                    )
                }
            }
    }
    
    func sendMessage(to recipientEmail: String, text: String) {
        guard let senderId = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()

        // Lookup recipient UID by email
        db.collection("users")
            .whereField("email", isEqualTo: recipientEmail)
            .getDocuments { snapshot, error in
                guard let doc = snapshot?.documents.first else {
                    print("Recipient not found")
                    return
                }

                let receiverId = doc.documentID

                let messageData: [String: Any] = [
                    "senderId": senderId,
                    "receiverId": receiverId,
                    "text": text,
                    "timestamp": Timestamp()
                ]

                db.collection("messages").addDocument(data: messageData)
            }
    }

    func stopListening() {
        listener?.remove()
    }

    func logout(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            print("Logout failed: \(error.localizedDescription)")
            completion(false)
        }
    }
}
