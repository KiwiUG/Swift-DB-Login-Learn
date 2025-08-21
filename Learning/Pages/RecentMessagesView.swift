//
//  RecentMessagesView.swift
//  Learning
//
//  Created by Utsav Gautam on 28/05/25.
//

import SwiftUI
import FirebaseAuth
import SwiftUI
import FirebaseAuth

struct Message: Identifiable {
    let id: String
    let senderId: String
    let receiverId: String
    let text: String
    let timestamp: Date
}

struct RecentMessagesView: View {
    @Binding var isLoggedIn: Bool
    @Binding var path: NavigationPath
    @StateObject private var messageHandler = RecentMessages()

    @State private var showNewMessageSheet = false
    @State private var newRecipientEmail = ""
    @State private var newMessageText = ""

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                List(messageHandler.recentMessages) { message in
                    VStack(alignment: .leading) {
                        Text("To: \(message.receiverId)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(message.text)
                            .font(.headline)
                    }
                }

                Button("Logout") {
                    messageHandler.logout { success in
                        if success {
                            isLoggedIn = false
                            path.removeLast(path.count)
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }

            Button(action: {
                showNewMessageSheet = true
            }) {
                Image(systemName: "plus")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .padding()
        }
        .navigationTitle("Messages")
        .onAppear {
            messageHandler.startListening()
        }
        .onDisappear {
            messageHandler.stopListening()
        }
        .sheet(isPresented: $showNewMessageSheet) {
            VStack {
                Text("Start New Conversation")
                    .font(.headline)

                TextField("Recipient's Email", text: $newRecipientEmail)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                TextField("Your Message", text: $newMessageText)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Button("Send") {
                    messageHandler.sendMessage(to: newRecipientEmail, text: newMessageText)
                    showNewMessageSheet = false
                    newRecipientEmail = ""
                    newMessageText = ""
                }
                .padding()
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
        }
    }
}

