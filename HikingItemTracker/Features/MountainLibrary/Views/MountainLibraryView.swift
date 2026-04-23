    //
    //  MountainLibraryView.swift
    //  HikingItemTracker
    //
    //  Created by Brian Anashari on 21/04/26.
    //

    import SwiftUI

    struct MountainLibraryView: View {
        @State var searchedMountain: String = ""
        @State var isSheetPresented : Bool = false
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        let allMountains: [Mountain] = Mountain.mocks
        
        var filteredMountains: [Mountain] {
            if searchedMountain.isEmpty {
                return allMountains
            } else {
                return allMountains.filter { $0.name.localizedCaseInsensitiveContains(searchedMountain) }
            }
        }
        
        @State private var selectedGrade: String = "Semua"
        let grades = ["Semua", "I", "II", "III", "IV", "V"]
        
        var body: some View {
            NavigationStack {
                Picker("Grade", selection: $selectedGrade) {
                    ForEach(grades, id: \.self) { grade in
                        Text(grade == "Semua" ? "Semua" : grade).tag(grade)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                if filteredMountains.isEmpty {
                    ContentUnavailableView.search(text: searchedMountain)
                } else {
                    ScrollView() {
                        VStack(alignment: .leading) {
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(filteredMountains, id: \.self) { mountain in
                                    Button {
                                        isSheetPresented = true
                                    } label: {
                                        MountainCard(mountain: mountain)
                                        
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Pilih Gunung")
                    .navigationSubtitle("Jelajahi Berbagai Macam Gunung di Nusantara")
                    .searchable(text: $searchedMountain, prompt: "Cari gunungmu")
                    .sheet(isPresented: $isSheetPresented) {
                        MountainDetailSheet()
                    }
                }
                
                
            }
            
        }
    }

    #Preview {
        MountainLibraryView()
    }
