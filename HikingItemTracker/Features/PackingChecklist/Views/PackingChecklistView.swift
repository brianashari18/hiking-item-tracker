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
    
    init(mountain: Mountain? = nil, tripDate: String? = nil, duration: Int = 1, numberOfPeople: Int = 1) {
        self.mountain = mountain
        let trip: HikingTripModel
        if let mountain = mountain {
            trip = ChecklistGenerator.generateTrip(
                mountain: mountain,
                tripDate: tripDate ?? "",
                duration: duration,
                numberOfPeople: numberOfPeople
            )
        } else {
            trip = .mock
        }
        _viewModel = State(initialValue: PackingChecklistViewModel(hikingTrip: trip))
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    PackingChecklistProgressCard(percentage: viewModel.progressPercentage)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }
                .listRowSeparator(.hidden)

                ForEach(viewModel.displayedSections) { section in
                    sectionView(for: section)
                }
            }
            .listStyle(.insetGrouped)
            .background(.black.opacity(0.05))
            .scrollContentBackground(.hidden)
            .safeAreaInset(edge: .bottom) {
                BottomActionButton(
                    title: viewModel.progressPercentage < 1.0
                    ? "Lengkapi Barangmu (\(Int(viewModel.progressPercentage * 100))%)"
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
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        router.showTripSetup(mountain: mountain)
                    } label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.semibold)
                    }
                }
                
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

    private func sectionView(for section: LogisticSectionModel) -> some View {
        Section {
            ForEach(section.items) { item in
                GearItemRow(
                    item: item,
                    onTogglePacked: { viewModel.togglePackedState(for: item) },
                    onTapDetails: { viewModel.selectItem(item) }
                )
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        viewModel.deleteItem(item)
                    } label: {
                        Label("Hapus", systemImage: "trash")
                    }
                }
            }
        } header: {
            sectionHeaderView(for: section)
        }
    }

    private func sectionHeaderView(for section: LogisticSectionModel) -> some View {
        HStack(alignment: .bottom) {
            Text(section.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.primary)

            Spacer()

            HStack {
                Button {
                    viewModel.toggleSectionPackedState(for: section)
                } label: {
                    Image(systemName: section.itemCount == section.totalCount ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(section.itemCount == section.totalCount ? .green : .secondary)
                }
                
                Text("\(section.itemCount)/\(section.totalCount)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .textCase(nil)
    }
}

#Preview {
    PackingChecklistView(mountain: Mountain.mocks.first!, tripDate: "1 Jan 2024", duration: 1, numberOfPeople: 1)
        .environment(AppRouter())
}
