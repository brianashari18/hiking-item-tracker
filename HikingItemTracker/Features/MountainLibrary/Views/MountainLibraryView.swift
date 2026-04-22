//
//  MountainLibraryView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 21/04/26.
//

import SwiftUI

struct MountainLibraryView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<20) { index in
                    MountainCard()
                }
            }
            .padding()
        }
    }
}

#Preview {
    MountainLibraryView()
}
