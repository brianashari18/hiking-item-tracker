    //
    //  MountainLibraryView.swift
    //  HikingItemTracker
    //
    //  Created by Brian Anashari on 21/04/26.
    //

    import SwiftUI

    struct MountainLibraryView: View {
        @State var searchedMountain: String = ""
        @State private var selectedMountain: Mountain?
        
        @Environment(AppRouter.self) private var router
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        let allMountains: [Mountain] = Mountain.mocks
        
        var filteredMountains: [Mountain] {
            var result = allMountains
                    if !searchedMountain.isEmpty {
                        result = result.filter { $0.name.localizedCaseInsensitiveContains(searchedMountain) }
                    }
            
            
            if selectedGrade != "Semua" {
                        result = result.filter { $0.grade == selectedGrade }
                    }
            
            return result
        }
        
        @State private var selectedGrade: String = "Semua"
        let grades = ["Semua", "I", "II", "III", "IV", "V"]
        
        var body: some View {
            NavigationStack {
                VStack {
                    Picker("Grade", selection: $selectedGrade) {
                        ForEach(grades, id: \.self) { grade in
                            Text(grade == "Semua" ? "Semua" : grade).tag(grade)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    Group {
                        if filteredMountains.isEmpty {
                            ContentUnavailableView.search(text: searchedMountain)
                        } else {
                            ScrollView() {
                                VStack(alignment: .leading) {
                                    LazyVGrid(columns: columns, spacing: 10) {
                                        ForEach(filteredMountains, id: \.self) { mountain in
                                            Button {
                                                selectedMountain = mountain
                                            } label: {
                                                MountainCard(mountain: mountain)
                                                
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                            
                        }
                    }
                }
                .navigationTitle("Pilih Gunung")
                .navigationSubtitle("Jelajahi Berbagai Macam Gunung di Nusantara")
                .searchable(text: $searchedMountain, prompt: "Cari gunungmu")
                .sheet(item: $selectedMountain) { mountain in
                    MountainDetailSheet(mountain: mountain)
                        .environment(router)
                }
            }
            
        }
    }

    #Preview {
        MountainLibraryView()
            .environment(AppRouter())
    }
