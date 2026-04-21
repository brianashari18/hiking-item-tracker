//
//  MountainLibraryView.swift
//  HikingItemTracker
//
//  Created by Brian Anashari on 20/04/26.
//

import SwiftUI

struct MountainLibraryView: View {
    @Environment(AppRouter.self) private var router
    @Environment(AppSession.self) private var session

    @State private var viewModel = MountainLibraryViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Filter Pills
                filterPillsRow

                // Grid or Empty State
                if viewModel.hasResults {
                    mountainGrid
                } else {
                    emptyStateView
                }
            }
            .navigationTitle("Pilih Gunung")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Cari nama gunung atau lokasi…"
            )
        }
        .sheet(item: $viewModel.selectedMountain) { mountain in
            MountainDetailSheet(mountain: mountain) { selected in
                session.selectedMountain = selected
                router.showTripSetup()
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Filter Pills

    private var filterPillsRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(MountainFilter.allCases) { filter in
                    FilterPill(
                        filter: filter,
                        isSelected: viewModel.activeFilter == filter
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            viewModel.activeFilter = filter
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color(.systemBackground))
        .overlay(alignment: .bottom) {
            Divider()
        }
    }

    // MARK: - Mountain Grid

    private var mountainGrid: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.filteredMountains) { mountain in
                    MountainCard(mountain: mountain)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                                viewModel.selectMountain(mountain)
                            }
                        }
                        .transition(.opacity.combined(with: .scale(scale: 0.95)))
                }
            }
            .padding(16)
            .padding(.bottom, 32)
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.filteredMountains.map(\.id))
        }
    }

    // MARK: - Empty State

    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Spacer()

            Image(systemName: "mountain.2")
                .font(.system(size: 60))
                .foregroundStyle(.quaternary)

            VStack(spacing: 6) {
                Text("Gunung Tidak Ditemukan")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Coba ubah kata kunci atau filter pencarian.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Button("Reset Filter") {
                viewModel.searchText = ""
                viewModel.activeFilter = .all
            }
            .buttonStyle(.bordered)
            .tint(.green)

            Spacer()
        }
        .padding(32)
    }
}

// MARK: - Filter Pill Component

private struct FilterPill: View {
    let filter: MountainFilter
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: filter.iconName)
                    .font(.caption)
                Text(filter.rawValue)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .semibold : .regular)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .foregroundStyle(isSelected ? .white : .primary)
            .background(
                isSelected
                    ? AnyShapeStyle(LinearGradient(
                        colors: [Color(hue:0.38,saturation:0.7,brightness:0.6),
                                 Color(hue:0.42,saturation:0.65,brightness:0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                      ))
                    : AnyShapeStyle(Color(.systemGray5))
            )
            .clipShape(Capsule())
            .shadow(
                color: isSelected ? Color(hue:0.38,saturation:0.7,brightness:0.6).opacity(0.35) : .clear,
                radius: 6, y: 2
            )
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}

#Preview {
    MountainLibraryView()
        .environment(AppRouter())
        .environment(AppSession())
}
