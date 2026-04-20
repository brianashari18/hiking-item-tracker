//
//  MountainPickerField.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 15/04/26.
//

import SwiftUI

struct MountainPickerField: View {
    let mountains: [Mountain]
    
    @Binding var isSheetPresented: Bool
    @Binding var selectedMountain: Mountain
    
    @State private var searchText = ""
    
    private let grades: [String] = ["I", "II", "III", "IV", "V"]
    private var filteredMountains: [Mountain] {
        if searchText.isEmpty {
            return mountains
        } else {
            return mountains.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(grades, id: \.self) { grade in
                    let mountainsInGrade = filteredMountains.filter { $0.grade == grade }
                    
                    if !mountainsInGrade.isEmpty {
                        MountainListSection(
                            grade: grade,
                            mountains: mountainsInGrade,
                            selectedMountain: selectedMountain
                        ) { mountain in
                            selectedMountain = mountain
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Cari nama gunung...")
            .navigationBarTitle("Kamu Mau ke Gunung Apa?")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isSheetPresented = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented = false
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .padding(5)
                    .background(.green.opacity(0.5))
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                }
                .sharedBackgroundVisibility(.hidden)
            }
            
        }
    }
}
