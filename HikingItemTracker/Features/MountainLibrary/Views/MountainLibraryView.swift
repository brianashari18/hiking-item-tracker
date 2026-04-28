    //
    //  MountainLibraryView.swift
    //  HikingItemTracker
    //
    //  Created by Brian Anashari on 21/04/26.
    //

    import SwiftUI

    struct MountainLibraryView: View {
        @Environment(AppSession.self) private var session
        @Environment(AppRouter.self) private var router
        
        @State var searchedMountain: String = ""
        @State private var selectedMountain: Mountain?
        
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
                result = result.filter { $0.grade.rawValue == selectedGrade }
            }
            
            return result
        }
        
        @State private var selectedGrade: String = "Semua"
        let grades = ["Semua", "I", "II", "III", "IV", "V"]
        
        var body: some View {
            NavigationStack {
                VStack(spacing: 0) {
                    Picker("Grade", selection: $selectedGrade) {
                        ForEach(grades, id: \.self) { grade in
                            Text(grade == "Semua" ? "Semua" : grade).tag(grade)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            // Active Trip Section
                            if let activeTrip = session.activeTrip, searchedMountain.isEmpty {
                                ActiveTripCard(
                                    trip: activeTrip,
                                    onContinue: {
                                        // Navigate to checklist or dashboard based on progress
                                        if activeTrip.progressPercentage >= 1.0 {
                                            router.showOnHikeDashboard(mountain: activeTrip.mountain, hikingTrip: activeTrip)
                                        } else {
                                            router.showPackingChecklist(
                                                mountain: activeTrip.mountain,
                                                tripDate: activeTrip.tripDate,
                                                duration: activeTrip.duration,
                                                numberOfPeople: activeTrip.numberOfPeople
                                            )
                                        }
                                    },
                                    onCancel: {
                                        session.activeTrip = nil
                                    }
                                )
                                .padding(.horizontal)
                                
                                Text("Jelajahi Gunung Lain")
                                    .font(.headline)
                                    .padding(.horizontal)
                            }

                            if filteredMountains.isEmpty {
                                ContentUnavailableView.search(text: searchedMountain)
                            } else {
                                LazyVGrid(columns: columns, spacing: 15) {
                                    ForEach(filteredMountains, id: \.self) { mountain in
                                        Button {
                                            selectedMountain = mountain
                                        } label: {
                                            MountainCard(mountain: mountain)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.vertical)
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
