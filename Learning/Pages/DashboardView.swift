//
//  DashboardView.swift
//  Learning
//
//  Created by Utsav Gautam on 28/05/25.
//

import SwiftUI

struct DashboardView: View {
    @Binding var isLoggedIn: Bool
    @Binding var path: NavigationPath
    
    var dashboardLogic = Dashboard()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to Dashboard!")
                .font(.title)
            
            Button("Logout") {
                dashboardLogic.logout { success in
                    if success {
                        isLoggedIn = false
                        path.removeLast(path.count)  // clear nav stack to show menu
                    } else {
                        print("Logout failed")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Dashboard")
        .navigationBarBackButtonHidden(true)
    }
}
