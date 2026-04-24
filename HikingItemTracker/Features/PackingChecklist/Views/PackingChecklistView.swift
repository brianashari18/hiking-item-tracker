//
//  PackingChecklistView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 19/04/26.
//

import SwiftUI

struct PackingChecklistView: View {
    @Environment(AppRouter.self) private var router
    private let mountain: Mountain?
    @State private var viewModel: PackingChecklistViewModel
    
    init(mountain: Mountain? = nil, tripDate: String? = nil) {
        self.mountain = mountain
        var trip = HikingTripModel.mock
        if let mountain = mountain {
            trip = HikingTripModel(mountainName: mountain.name, tripDate: tripDate ?? "", sections: trip.sections)
        }
        _viewModel = State(initialValue: PackingChecklistViewModel(hikingTrip: trip))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    PackingChecklistProgressCard(percentage: viewModel.progressPercentage)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(viewModel.displayedSections) { section in
                            LogisticSectionView(
                                sectionData: section,
                                onTogglePacked: viewModel.togglePackedState,
                                onToggleSectionPacked: { viewModel.toggleSectionPackedState(for: $0) },
                                onTapItem: viewModel.selectItem,
                                onDeleteItem: viewModel.deleteItem
                            )
                        }
                    }
                    
                    Spacer()
                }
                .padding(20)
            }
            .safeAreaInset(edge: .bottom) {
                BottomActionButton(
                    title: viewModel.progressPercentage < 1.0
                    ? "Lengkapi Barangmu Dulu"
                    : "Mulai Pendakian",
                    action: viewModel.progressPercentage >= 1.0
                    ? { 
                        if let mountain = mountain {
                            router.showOnHikeDashboard(mountain: mountain, hikingTrip: viewModel.hikingTrip)
                        }
                    }
                    : nil
                )
            }
            .navigationTitle(viewModel.mountainName)
            .navigationSubtitle(viewModel.tripDate)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button(action: {}) {
                            Label("Bag View", systemImage: "briefcase")
                        }
                        
                        Button(action: {
                            viewModel.checkAllItems()
                        }) {
                            Label("Checklist Semua", systemImage: "checkmark.circle")
                        }
                        
                        Divider()
                        
                        Picker("Kategori Berdasarkan", selection: $viewModel.groupingMode) {
                            ForEach(PackingChecklistGroupingMode.allCases) { mode in
                                Text(mode.displayTitle).tag(mode)
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.isAddSheetPresented = true 
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(item: $viewModel.selectedItem) { item in
            AddEditItemView(item: item, onSave: viewModel.updateItem)
        }
        .sheet(isPresented: $viewModel.isAddSheetPresented) {
            AddEditItemView(onSave: viewModel.addItem)
        }
    }
}

#Preview {
    PackingChecklistView()
        .environment(AppRouter())
}
