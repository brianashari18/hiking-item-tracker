//
//  MountainLibraryView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 21/04/26.
//

import SwiftUI

struct MountainLibraryView: View {
    @State var searchedMountain: String = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack(alignment: .leading) {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(0..<20) { index in
                            MountainCard()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Pilih Gunung")
            .navigationSubtitle("Jelajahi Berbagai Macam Gunung di Nusantara")
            .searchable(text: $searchedMountain, prompt: "Cari gunungmu")
        }
        
    }
}

#Preview {
    MountainLibraryView()
}
