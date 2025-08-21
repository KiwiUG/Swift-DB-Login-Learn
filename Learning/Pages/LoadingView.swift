//
//  LoadingView.swift
//  Learning
//
//  Created by Utsav Gautam on 28/05/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color(red: 35/255, green: 209/255, blue: 163/255)))
                .scaleEffect(2)
            Text("Loading...")
                .font(.headline)
                .foregroundColor(Color(red: 35/255, green: 209/255, blue: 163/255))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3))
        .edgesIgnoringSafeArea(.all)
    }
}
